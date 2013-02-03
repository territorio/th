require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  include ActiveSupport

  test "get" do
    get :index, :format => :json
    puts JSON.decode(@response.body)
    assert_response :success
  end

  test "by_category_one" do
    get( :index, {:category => [categories(:one)], :format => :json})
    puts JSON.decode(@response.body)
    assert_response :success
    assert_equal 2, JSON.decode(@response.body)['events'].length
  end

  test "by_category_two" do
    get( :index, {:category => [categories(:two)], :format => :json})
    puts JSON.decode(@response.body)
    assert_response :success
    assert_equal 2, JSON.decode(@response.body)['events'].length
  end

  test "by_category_one_two" do
    get( :index, {:category => [categories(:one), categories(:two)], :format => :json})
    puts JSON.decode(@response.body)
    assert_response :success
    assert_equal 3, JSON.decode(@response.body)['events'].length
  end

end
