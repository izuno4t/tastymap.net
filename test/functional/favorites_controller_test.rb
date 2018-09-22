require File.dirname(__FILE__) + '/../test_helper'
require 'favorites_controller'

# Re-raise errors caught by the controller.
class FavoritesController; def rescue_action(e) raise e end; end

class FavoritesControllerTest < Test::Unit::TestCase
  fixtures :favorites

  def setup
    @controller = FavoritesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = favorites(:first).id
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:favorites)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:favorite)
    assert assigns(:favorite).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:favorite)
  end

  def test_create
    num_favorites = Favorite.count

    post :create, :favorite => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_favorites + 1, Favorite.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:favorite)
    assert assigns(:favorite).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Favorite.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Favorite.find(@first_id)
    }
  end
end
