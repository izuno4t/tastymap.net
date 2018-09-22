# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  protected
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
