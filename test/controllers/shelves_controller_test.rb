require 'test_helper'

class ShelvesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shelves_index_url
    assert_response :success
  end

  test "should get show" do
    get shelves_show_url
    assert_response :success
  end

  test "should get new" do
    get shelves_new_url
    assert_response :success
  end

  test "should get edit" do
    get shelves_edit_url
    assert_response :success
  end

end
