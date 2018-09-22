class WelcomeController < ApplicationController

	def index
		redirect_to :controller => 'dashboard' if logged_in?
	end
  
end
