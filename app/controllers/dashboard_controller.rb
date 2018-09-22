class DashboardController < ApplicationController

   def index
    @stores = Store.find(:all, :limit => '5', :order => 'created_at DESC')
  end
  
end
