require "application_system_test_case"

class PlayerSignupsTest < ApplicationSystemTestCase
  setup do
    @player_signup = player_signups(:one)
  end

  test "visiting the index" do
    visit player_signups_url
    assert_selector "h1", text: "Player Signups"
  end

  test "creating a Player signup" do
    visit player_signups_url
    click_on "New Player Signup"

    fill_in "Listing", with: @player_signup.listing_id
    fill_in "Player", with: @player_signup.player_id
    click_on "Create Player signup"

    assert_text "Player signup was successfully created"
    click_on "Back"
  end

  test "updating a Player signup" do
    visit player_signups_url
    click_on "Edit", match: :first

    fill_in "Listing", with: @player_signup.listing_id
    fill_in "Player", with: @player_signup.player_id
    click_on "Update Player signup"

    assert_text "Player signup was successfully updated"
    click_on "Back"
  end

  test "destroying a Player signup" do
    visit player_signups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Player signup was successfully destroyed"
  end
end
