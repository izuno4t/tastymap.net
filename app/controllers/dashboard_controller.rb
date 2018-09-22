require "pp"

class DashboardController < ApplicationController
  def index
    list
    render :action => 'list'
  end
  
  def list
    @stores = Store.find(:all, :limit => '5', :order => 'created_at DESC')
  end
end
