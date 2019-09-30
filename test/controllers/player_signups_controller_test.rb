require 'test_helper'

class PlayerSignupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player_signup = player_signups(:one)
  end

  test "should get index" do
    get player_signups_url
    assert_response :success
  end

  test "should get new" do
    get new_player_signup_url
    assert_response :success
  end

  test "should create player_signup" do
    assert_difference('PlayerSignup.count') do
      post player_signups_url, params: { player_signup: { listing_id: @player_signup.listing_id, player_id: @player_signup.player_id } }
    end

    assert_redirected_to player_signup_url(PlayerSignup.last)
  end

  test "should show player_signup" do
    get player_signup_url(@player_signup)
    assert_response :success
  end

  test "should get edit" do
    get edit_player_signup_url(@player_signup)
    assert_response :success
  end

  test "should update player_signup" do
    patch player_signup_url(@player_signup), params: { player_signup: { listing_id: @player_signup.listing_id, player_id: @player_signup.player_id } }
    assert_redirected_to player_signup_url(@player_signup)
  end

  test "should destroy player_signup" do
    assert_difference('PlayerSignup.count', -1) do
      delete player_signup_url(@player_signup)
    end

    assert_redirected_to player_signups_url
  end
end
