require "application_system_test_case"

class MeetsTest < ApplicationSystemTestCase
  setup do
    @meet = meets(:one)
  end

  test "visiting the index" do
    visit meets_url
    assert_selector "h1", text: "Meets"
  end

  test "should create meet" do
    visit meets_url
    click_on "New meet"

    fill_in "Body", with: @meet.body
    fill_in "Date hosted", with: @meet.date_hosted
    fill_in "Geotag", with: @meet.geotag
    fill_in "User", with: @meet.user_id
    click_on "Create Meet"

    assert_text "Meet was successfully created"
    click_on "Back"
  end

  test "should update Meet" do
    visit meet_url(@meet)
    click_on "Edit this meet", match: :first

    fill_in "Body", with: @meet.body
    fill_in "Date hosted", with: @meet.date_hosted.to_s
    fill_in "Geotag", with: @meet.geotag
    fill_in "User", with: @meet.user_id
    click_on "Update Meet"

    assert_text "Meet was successfully updated"
    click_on "Back"
  end

  test "should destroy Meet" do
    visit meet_url(@meet)
    click_on "Destroy this meet", match: :first

    assert_text "Meet was successfully destroyed"
  end
end
