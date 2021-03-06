require 'test_helper'

class TwitterBlockControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get twitter_block_show_url
    assert_response :success
  end

  test "should get new" do
    get twitter_block_new_url
    assert_response :success
  end

  test "should get create" do
    get twitter_block_create_url
    assert_response :success
  end

  test "should get edit" do
    get twitter_block_edit_url
    assert_response :success
  end

  test "should get update" do
    get twitter_block_update_url
    assert_response :success
  end

  test "should get destroy" do
    get twitter_block_destroy_url
    assert_response :success
  end

end
