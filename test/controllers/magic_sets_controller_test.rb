require "test_helper"

class MagicSetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @magic_set = magic_sets(:one)
  end

  test "should get index" do
    get magic_sets_url
    assert_response :success
  end

  test "should get new" do
    get new_magic_set_url
    assert_response :success
  end

  test "should create magic_set" do
    assert_difference("MagicSet.count") do
      post magic_sets_url, params: { magic_set: { code: @magic_set.code, name: @magic_set.name } }
    end

    assert_redirected_to magic_set_url(MagicSet.last)
  end

  test "should show magic_set" do
    get magic_set_url(@magic_set)
    assert_response :success
  end

  test "should get edit" do
    get edit_magic_set_url(@magic_set)
    assert_response :success
  end

  test "should update magic_set" do
    patch magic_set_url(@magic_set), params: { magic_set: { code: @magic_set.code, name: @magic_set.name } }
    assert_redirected_to magic_set_url(@magic_set)
  end

  test "should destroy magic_set" do
    assert_difference("MagicSet.count", -1) do
      delete magic_set_url(@magic_set)
    end

    assert_redirected_to magic_sets_url
  end
end
