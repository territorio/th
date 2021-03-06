require 'test_helper'


class CategoriesControllerTest < ActionController::TestCase
  include ActiveSupport

  test "get" do
    get :index, :format => :json
    assert_response :success
  end

  test "get_many" do
    get( :index, {:ids => [categories(:one).id, categories(:two).id], :format => :json})
    assert_response :success
    assert_equal 2, JSON.decode(@response.body)['categories'].length
  end

end
