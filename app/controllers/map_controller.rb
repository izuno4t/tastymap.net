class MapController < ApplicationController
	skip_before_filter :login_required

	def index
		@stores = Store.find(:all, :order => 'created_at desc', :limit => 10)
	end
	
	def xml
		if user?
			@stores = Store.find(:all)
		else
			@stores = Store.find(:all, :limit => '2')
		end
		headers["Content-Type"] = "text/xml; charset=utf-8"
		render :layout => false
	end
end
