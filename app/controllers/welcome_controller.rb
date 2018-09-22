class WelcomeController < ApplicationController
	
	skip_before_filter :login_required
	  
	def index
		redirect_to :controller => 'dashboard' if user?
	end
end
