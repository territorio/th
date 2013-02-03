require 'test_helper'


class EventsControllerTest < ActionController::TestCase
  include ActiveSupport

  test "get" do
    get :index, :format => :json
    puts JSON.decode(@response.body)
    assert_response :success
  end

  test "get_many" do
    get( :index, {:ids => [1,2], :format => :json})
    assert_response :success
    assert_equal 2, JSON.decode(@response.body)['categories'].length
  end

end
