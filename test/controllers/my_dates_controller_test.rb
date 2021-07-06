require 'test_helper'

class MyDatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_date = my_dates(:one)
  end

  test "should get index" do
    get my_dates_url
    assert_response :success
  end

  test "should get new" do
    get new_my_date_url
    assert_response :success
  end

  test "should create my_date" do
    assert_difference('MyDate.count') do
      post my_dates_url, params: { my_date: {  } }
    end

    assert_redirected_to my_date_url(MyDate.last)
  end

  test "should show my_date" do
    get my_date_url(@my_date)
    assert_response :success
  end

  test "should get edit" do
    get edit_my_date_url(@my_date)
    assert_response :success
  end

  test "should update my_date" do
    patch my_date_url(@my_date), params: { my_date: {  } }
    assert_redirected_to my_date_url(@my_date)
  end

  test "should destroy my_date" do
    assert_difference('MyDate.count', -1) do
      delete my_date_url(@my_date)
    end

    assert_redirected_to my_dates_url
  end
end
