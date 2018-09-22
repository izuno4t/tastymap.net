require File.dirname(__FILE__) + '/../test_helper'
require 'tos_controller'

# Re-raise errors caught by the controller.
class TosController; def rescue_action(e) raise e end; end

class TosControllerTest < Test::Unit::TestCase
  def setup
    @controller = TosController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
