require 'test_helper'

class CharAttributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @char_attribute = char_attributes(:one)
  end

  test "should get index" do
    get char_attributes_url
    assert_response :success
  end

  test "should get new" do
    get new_char_attribute_url
    assert_response :success
  end

  test "should create char_attribute" do
    assert_difference('CharAttribute.count') do
      post char_attributes_url, params: { char_attribute: { name: @char_attribute.name, value: @char_attribute.value } }
    end

    assert_redirected_to char_attribute_url(CharAttribute.last)
  end

  test "should show char_attribute" do
    get char_attribute_url(@char_attribute)
    assert_response :success
  end

  test "should get edit" do
    get edit_char_attribute_url(@char_attribute)
    assert_response :success
  end

  test "should update char_attribute" do
    patch char_attribute_url(@char_attribute), params: { char_attribute: { name: @char_attribute.name, value: @char_attribute.value } }
    assert_redirected_to char_attribute_url(@char_attribute)
  end

  test "should destroy char_attribute" do
    assert_difference('CharAttribute.count', -1) do
      delete char_attribute_url(@char_attribute)
    end

    assert_redirected_to char_attributes_url
  end
end
