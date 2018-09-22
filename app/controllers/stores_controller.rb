class StoresController < ApplicationController

  # GET /stores
  # GET /stores.xml
  def index
  	unless params[:q].blank?
  		@condition = ["name LIKE ? OR category LIKE ? OR note LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%"]
  	end

    @stores = Store.paginate(
      :page => params[:page],
      :per_page => 12,
      :conditions => @condition,
      :order => "created_at desc, lat desc, lng"
    )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  #{ render :xml => @stores }
    end
  end

  def show
    @store = Store.find(params[:id])

  end

  def new
    @store = Store.new
  end

  def edit
    @store = Store.find(params[:id])
  end

  def create
    @store = Store.new(params[:store])
    @store.tag_list = params[:store][:tag_list]
    @store.user = current_user
    
    if @store.save
      @store.favorites.create(:user_id => current_user.id)
      flash[:notice] = @store.name + ' を追加しました。'
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end

  end

  def update
    @store = Store.find(params[:id])
    @store.tag_list = params[:tag_list]
   	#params[:photo][:created_by] = session[:user].id
    #@store.photos.create(params[:photo]) unless 0 == params[:photo][:photo].size

    if @store.update_attributes(params[:store])
      flash[:notice] = @store.name + ' を更新しました。'
      redirect_to (params[:from].blank?)? {:action => 'show', :id => @store}:url_for(params[:from])
    else
      render :action => 'edit'
    end
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy

    redirect_to(stores_url)
  end
  
  def yours
    @stores = Store.paginate(
      :page => params[:page],
      :per_page => 12,
      :order => "created_at desc, lat desc, lng",
      :joins => "INNER JOIN favorites ON (favorites.store_id = stores.id and favorites.user_id=#{current_user.id})"
    )

    render :action => 'index'
  end

end
