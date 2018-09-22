class FavoritesController < ApplicationController
  def add
  	@favorite = Favorite.find(:all, :conditions => ["store_id = :store_id and user_id = :user_id", {:store_id => params[:id], :user_id => session[:user].id}])
  	if @favorite.empty?
  	  @favorite = Favorite.new(:store_id => params[:id], :user_id => session[:user].id)  	  
	  if @favorite.save
	    flash[:notice] = 'Add to your favorite was successfully.'
	  end
	end
    redirect_to url_for(params[:from])
  end

  def remove
    @favorite = Favorite.delete_all(["store_id = :store_id and user_id = :user_id", {:store_id => params[:id], :user_id => session[:user].id}])
    redirect_to url_for(params[:from])
  end
end
