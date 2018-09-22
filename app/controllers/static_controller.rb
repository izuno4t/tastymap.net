class StaticController < ApplicationController
	skip_before_filter :login_required
	
	def aboutus
	end
	
	def contact
	end

	def help
	end

	def termsofuse
	end

	def privacy
	end

	def api
	end

	def feedback
	end

end
