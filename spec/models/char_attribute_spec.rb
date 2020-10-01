require 'rails_helper'

RSpec.describe CharAttribute, type: :model do
  context 'validation tests' do
    before(:each) do
      @user = FactoryBot.create(:user, username: "test_user", email: "test_user@gmail.com", password: "test_password", password_confirmation: "test_password")
      @character = FactoryBot.create(:character, user: @user, name: "Ashe")
    end
    it 'ensures character attribute name presence' do
      attribute = @character.char_attributes.build(value: 5)
      expect(attribute.save).to eq(false)
    end

    it 'ensures character attribute value presence' do
      character = @character.char_attributes.build(name: "Power")
      expect(character.save).to eq(false)
    end
  end
end
