require "test_helper"

class CommandersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @commander = commanders(:one)
  end

  test "should get index" do
    get commanders_url
    assert_response :success
  end

  test "should get new" do
    get new_commander_url
    assert_response :success
  end

  test "should create commander" do
    assert_difference("Commander.count") do
      post commanders_url, params: { commander: { name: @commander.name } }
    end

    assert_redirected_to commander_url(Commander.last)
  end

  test "should show commander" do
    get commander_url(@commander)
    assert_response :success
  end

  test "should get edit" do
    get edit_commander_url(@commander)
    assert_response :success
  end

  test "should update commander" do
    patch commander_url(@commander), params: { commander: { name: @commander.name } }
    assert_redirected_to commander_url(@commander)
  end

  test "should destroy commander" do
    assert_difference("Commander.count", -1) do
      delete commander_url(@commander)
    end

    assert_redirected_to commanders_url
  end
end
