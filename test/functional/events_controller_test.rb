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

  test "by_date" do
    get( :index, {:date => '2012-02-01', :format => :json})
    puts JSON.decode(@response.body)
    puts JSON.decode(@response.body)['events'].length
    assert_response :success
  end

  test "by_date_and_category" do
    get( :index, {:date => '2012-02-01', :category => [categories(:one)], :format => :json})
    puts JSON.decode(@response.body)
    puts JSON.decode(@response.body)['events'].length
    assert_response :success
  end

end
