require 'pp'

class StoresController < ApplicationController
  skip_before_filter :login_required, :only => 'recentlyadded'

  def recentlyadded
    list
    render :action => 'list'
  end
  
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def xml
    @stores = Store.find(:all)
    @headers["Content-Type"] = "text/xml; charset=utf-8"
     render :layout => false
  end

  def list
  	unless params[:q].blank? 
  		@condition = ["name LIKE ? OR category LIKE ? OR note LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%"]
  	end
  	
    @store_pages, @stores = paginate :stores, 
                          :per_page => 12, 
                          :conditions => @condition,
                          :order => "created_at desc, lat desc, lng"
    render :action => 'list'
  end

  def yours
    @store_pages, @stores = paginate :stores,
    								 :per_page => 12,
    								 :order => "created_at desc, lat desc, lng", 
    								 :joins => "INNER JOIN favorites ON (favorites.store_id = id and favorites.user_id=#{session[:user].id})"
    render :action => 'list'
  end

  def show
    @store = Store.find(params[:id])
    pp params[:from]
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(params[:store])
    if @store.save
      pp params[:store][:tag_list]
      @store.tag_list = params[:store][:tag_list]
      @store.user = session[:user]
      @store.favorites.create(:user_id => session[:user].id)
      #@store.photos.create(params[:photo]) unless 0 == params[:photo][:photo].size
      flash[:notice] = 'Store was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    @store.tag_list = params[:tag_list]
   	#params[:photo][:created_by] = session[:user].id
    #@store.photos.create(params[:photo]) unless 0 == params[:photo][:photo].size
    if @store.update_attributes(params[:store])
      flash[:notice] = @store.name + 'を更新しました。'
      redirect_to (params[:from].blank?)? {:action => 'show', :id => @store}:url_for(params[:from])
    else
      render :action => 'edit'
    end
  end

  def destroy
    redirect_to :action => 'list'
  end  
end
