require "application_system_test_case"

class PresentationsTest < ApplicationSystemTestCase
  setup do
    @presentation = presentations(:one)
  end

  test "visiting the index" do
    visit presentations_url
    assert_selector "h1", text: "Presentations"
  end

  test "should create presentation" do
    visit new_presentation_url

    fill_in "Name or Group", with: @presentation.group_name
    fill_in "Topic", with: @presentation.topic
    fill_in "Date", with: @presentation.present_date
    fill_in "Start Time", with: @presentation.present_start_time
    fill_in "End Time", with: @presentation.present_end_time
    fill_in "Location", with: @presentation.location
    click_on "Create Presentation"

    assert_text "Presentation was successfully created"
    click_on "Back"
  end

  test "should update Presentation" do
    visit presentation_url(@presentation)
    
    click_on "Edit this presentation", match: :first

    fill_in "Name or Group", with: @presentation.group_name
    fill_in "Topic", with: @presentation.topic
    fill_in "Date", with: @presentation.present_date
    fill_in "Start Time", with: @presentation.present_start_time
    fill_in "End Time", with: @presentation.present_end_time
    fill_in "Location", with: @presentation.location
    click_on "Update Presentation"

    assert_text "Presentation was successfully updated"
    click_on "Back"
  end

  test "should destroy Presentation" do
    visit presentation_url(@presentation)
    click_on "Destroy this presentation", match: :first

    assert_text "Presentation was successfully destroyed"
  end
end
