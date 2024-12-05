require "application_system_test_case"

class CommentsMsTest < ApplicationSystemTestCase
  setup do
    @comments_m = comments_ms(:one)
  end

  test "visiting the index" do
    visit comments_ms_url
    assert_selector "h1", text: "Comments ms"
  end

  test "should create comments m" do
    visit comments_ms_url
    click_on "New comments m"

    fill_in "Body", with: @comments_m.body
    click_on "Create Comments m"

    assert_text "Comments m was successfully created"
    click_on "Back"
  end

  test "should update Comments m" do
    visit comments_m_url(@comments_m)
    click_on "Edit this comments m", match: :first

    fill_in "Body", with: @comments_m.body
    click_on "Update Comments m"

    assert_text "Comments m was successfully updated"
    click_on "Back"
  end

  test "should destroy Comments m" do
    visit comments_m_url(@comments_m)
    click_on "Destroy this comments m", match: :first

    assert_text "Comments m was successfully destroyed"
  end
end
