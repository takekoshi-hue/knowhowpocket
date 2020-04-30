require 'test_helper'

class PocketsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pockets_index_url
    assert_response :success
  end

  test "should get show" do
    get pockets_show_url
    assert_response :success
  end

  test "should get destroy" do
    get pockets_destroy_url
    assert_response :success
  end

  test "should get create" do
    get pockets_create_url
    assert_response :success
  end

  test "should get new" do
    get pockets_new_url
    assert_response :success
  end

  test "should get update" do
    get pockets_update_url
    assert_response :success
  end

  test "should get edit" do
    get pockets_edit_url
    assert_response :success
  end

end
