# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

require 'pp'
require 'login_engine'
require 'mini_magick'
require 'openssl'

class ApplicationController < ActionController::Base
	include LoginEngine
	helper :user
	#model :user
	
	before_filter :restore_session, :login_required
	
	# Pick a unique cookie name to distinguish our session data from others'
	session :session_key => '_tastymap_session_id'
	
	def restore_session
		return if user? or cookies[:tastymap].nil?

		store_location

		s = _decrypt(cookies[:tastymap])
		x = Hash[*s.split(/[&=]/)]
		login = x["login"]
		password = x["password"]
		
    if session[:user] = User.authenticate(login, password)
			session[:user].logged_in_at = Time.now
			session[:user].logged_in_from = @request.env['REMOTE_ADDR']
			session[:user].user_agent = @request.env['HTTP_USER_AGENT']
			session[:user].save
			store_session login, password
			redirect_to_stored_or_default :controller => 'dashboard'
    end
	end
	
	def store_session(login, password, term = 3600 * 24 * 180)
		s = "login=#{login}&password=#{password}"
		cookies[:tastymap] = { :value => _encrypt(s),:expires => Time.now + term }
		logger.info("store login/password to cookie")
	end

	
	def square_resize_and_crop(image, square_size) 
	# 		geometry = to_geometry(square_size, square_size) 
		if image[:width] < image[:height] 
			shave_off = (( 
			  image[:height]- 
			  image[:width])/2).round 
			image.shave("0x#{shave_off}") 
		elsif image[:width] > image[:height] 
			shave_off = (( 
			  image[:width]- 
			  image[:height])/2).round 
			image.shave("#{shave_off}x0") 
		end 
		image.resize(square_size) 
		return image 
	end

	private
		def _encrypt(s, salt = '_i54bykt_ex9w!h4e2')
			enc = OpenSSL::Cipher::Cipher.new('aes256')
			enc.encrypt
			enc.pkcs5_keyivgen(salt)
			((enc.update(s) + enc.final).unpack("H*")).to_s
			rescue
				false
		end
	
		def _decrypt(s, salt = '_i54bykt_ex9w!h4e2')
			dec = OpenSSL::Cipher::Cipher.new('aes256') 
			dec.decrypt 
			dec.pkcs5_keyivgen(salt)
			(dec.update(Array.new([s]).pack("H*")) + dec.final)
			rescue  
				false 
		end
		
end