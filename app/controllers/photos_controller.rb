class PhotosController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @photo_pages, @photos = paginate :photos, :per_page => 20, :order => "created_at desc"
  end

  def add
    @store = Store.find(params[:id])
  	if @store
  		@photo = Photo.new
  	  @photo.store_id = @store.id
  	else
  		redirect_to :action => 'list'
  	end
  end

  def create
    @photo = Photo.new(params[:photo])
    @photo.created_by = session[:user].id
    @store = Store.find(@photo.store.id)
  	@photo.tag_list = @store.name
    if @photo.save
      flash[:notice] =  @photo.store.name + 'に写真を追加しました。'
      redirect_to :action => 'list'
    else
      render :action => 'add', :id => @photo
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(params[:photo])
      flash[:notice] = @photo.title + 'を更新しました。'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def destroy
    Photo.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
