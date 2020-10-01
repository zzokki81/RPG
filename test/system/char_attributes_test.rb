require "application_system_test_case"
# Character Attributes Test
class CharAttributesTest < ApplicationSystemTestCase
  setup do
    @char_attribute = char_attributes(:one)
  end

  test "visiting the index" do
    visit char_attributes_url
    assert_selector "h1", text: "Char Attributes"
  end

  test "creating a Char attribute" do
    visit char_attributes_url
    click_on "New Char Attribute"

    fill_in "Name", with: @char_attribute.name
    fill_in "Value", with: @char_attribute.value
    click_on "Create Char attribute"

    assert_text "Char attribute was successfully created"
    click_on "Back"
  end

  test "updating a Char attribute" do
    visit char_attributes_url
    click_on "Edit", match: :first

    fill_in "Name", with: @char_attribute.name
    fill_in "Value", with: @char_attribute.value
    click_on "Update Char attribute"

    assert_text "Char attribute was successfully updated"
    click_on "Back"
  end

  test "destroying a Char attribute" do
    visit char_attributes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Char attribute was successfully destroyed"
  end
end
