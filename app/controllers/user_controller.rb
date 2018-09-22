require 'pp'

class UserController < ApplicationController
  require_dependency 'user'

  def index
    profile
    render :action => 'profile'
  end

  # Override this function in your own application to define a custom home action.
  def profile
  end

  # The action used to log a user in. If the user was redirected to the login page
  # by the login_required method, they should be sent back to the page they were
  # trying to access. If not, they will be sent to "/user/home".
  def login
    return if generate_blank
    @user = User.new(params[:user])
    session[:user] = User.authenticate(params[:user][:login], params[:user][:password])
    unless session[:user].nil?
			session[:user].logged_in_at = Time.now
			session[:user].logged_in_from = request.env['REMOTE_ADDR']
			session[:user].user_agent = request.env['HTTP_USER_AGENT']
			session[:user].save
			
			if '1' == params[:user][:rememberme]
				store_session params[:user][:login], params[:user][:password]
			else
				cookies.delete :tastymap
			end
			flash[:notice] = 'Login successful'
			redirect_to_stored_or_default :controller => 'dashboard'
    else
      @login = params[:user][:login]
      logger.info("Login unsuccessful")
      flash.now[:warning] = 'Login unsuccessful'
    end
  end

  # Register as a new user. Upon successful registration, the user will be sent to
  # "/user/login" to enter their details.
  def signup
    return if generate_blank
    params[:user].delete('form')
    params[:user].delete('verified') # you CANNOT pass this as part of the request
    @user = User.new(params[:user])
    begin
      #User.transaction(@user) do
      User.transaction do
        @user.new_password = true
        unless LoginEngine.config(:use_email_notification) and LoginEngine.config(:confirm_account)
          @user.verified = 1
        end
        if @user.save
          key = @user.generate_security_token
          url = url_for(:action => 'home', :user_id => @user.id, :key => key)
          flash[:notice] = 'Signup successful!'
          if LoginEngine.config(:use_email_notification) and LoginEngine.config(:confirm_account)
            UserNotify.deliver_signup(@user, params[:user][:password], url)
            flash[:notice] << ' Please check your registered email account to verify your account registration and continue with the login.'
          else
            flash[:notice] << ' Please log in.'
          end
          redirect_to :action => 'login'
        end
      end
    rescue Exception => e
      flash.now[:notice] = nil
      flash.now[:warning] = 'Error creating account: confirmation email not sent'
      logger.error "Unable to send confirmation E-Mail:"
      logger.error e
    end
  end

  def logout
    session[:user] = nil
    cookies.delete :tastymap
    redirect_to :controller => 'welcome'
  end
  
  protected  	
    def do_edit_user(user)
      begin
        #User.transaction(user) do
        User.transaction do
          _save_buddyicon(user, params[:user][:buddyicon])
          user.attributes = params[:user].delete_if { |k,v| not LoginEngine.config(:changeable_fields).include?(k) }
          if user.save
            flash[:notice] = "User details updated"
          else
            flash[:warning] = "Details could not be updated! Please retry."
          end
        end
       #rescue
       #  flash.now[:warning] = "Error updating user details. Please try again later."
      end
    end

  private
		def _save_buddyicon(user, file)
			return if 0 == file.size 
	
			extention = File.extname(file.original_filename)
			user.buddyicon = user.id.to_s + extention
	
			save_dir = "#{RAILS_ROOT}/public/buddyicons"
			Dir.mkdir(save_dir) unless File.exist?(save_dir)
			image = square_resize_and_crop(MiniMagick::Image.from_blob(file.read), "48x48")
			image.write("#{save_dir}/#{user.buddyicon}");
			File.chmod(0644, "#{save_dir}/#{user.buddyicon}")
		end
		
end
