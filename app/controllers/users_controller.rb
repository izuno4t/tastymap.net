class UsersController < ApplicationController

  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end

  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && user && !user.active?
      user.activate!
      flash[:notice] = "Signup complete! Please sign in to continue."
      redirect_to '/login'
    when params[:activation_code].blank?
      flash[:error] = "The activation code was missing.  Please follow the URL from your email."
      redirect_back_or_default('/')
    else 
      flash[:error]  = "We couldn't find a user with that activation code -- check your email? Or maybe you've already activated -- try signing in."
      redirect_back_or_default('/')
    end
  end

  def profile
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    _save_buddyicon(@user, params[:user][:buddyicon])

    if @user.update_attributes(params[:user])
      flash[:notice] = @user.name + ' を更新しました。'
      redirect_to (params[:from].blank?)? {:action => 'profile', :id => @user}:url_for(params[:from])
    else
      render :action => 'profile'
    end

  end

  private
		def _save_buddyicon(user, file)
			return if file.nil? || 0 == file.size

			extention = File.extname(file.original_filename)
			user.buddyicon = user.id.to_s + extention

			save_dir = "#{RAILS_ROOT}/public/buddyicons"
			Dir.mkdir(save_dir) unless File.exist?(save_dir)
			image = square_resize_and_crop(MiniMagick::Image.from_blob(file.read), "48x48")
			image.write("#{save_dir}/#{user.buddyicon}");
			File.chmod(0644, "#{save_dir}/#{user.buddyicon}")
		end

end
