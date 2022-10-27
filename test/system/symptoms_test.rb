require "application_system_test_case"

class SymptomsTest < ApplicationSystemTestCase
  setup do
    @symptom = symptoms(:one)
  end

  test "visiting the index" do
    visit symptoms_url
    assert_selector "h1", text: "Symptoms"
  end

  test "should create symptom" do
    visit symptoms_url
    click_on "New symptom"

    fill_in "Comment", with: @symptom.comment
    fill_in "Date", with: @symptom.date
    fill_in "Intensity", with: @symptom.intensity
    fill_in "Name", with: @symptom.name
    fill_in "Time", with: @symptom.time
    fill_in "User", with: @symptom.user_id
    click_on "Create Symptom"

    assert_text "Symptom was successfully created"
    click_on "Back"
  end

  test "should update Symptom" do
    visit symptom_url(@symptom)
    click_on "Edit this symptom", match: :first

    fill_in "Comment", with: @symptom.comment
    fill_in "Date", with: @symptom.date
    fill_in "Intensity", with: @symptom.intensity
    fill_in "Name", with: @symptom.name
    fill_in "Time", with: @symptom.time
    fill_in "User", with: @symptom.user_id
    click_on "Update Symptom"

    assert_text "Symptom was successfully updated"
    click_on "Back"
  end

  test "should destroy Symptom" do
    visit symptom_url(@symptom)
    click_on "Destroy this symptom", match: :first

    assert_text "Symptom was successfully destroyed"
  end
end
