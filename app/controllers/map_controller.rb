class MapController < ApplicationController

  def index
		@stores = Store.find(:all, :order => 'created_at desc', :limit => 10)
	end
  
end
