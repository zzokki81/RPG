require 'rails_helper'

RSpec.describe Character, type: :model do
  context 'validation tests' do
   before(:each) do
      @user = FactoryBot.create(:user, username: "test_user", email: "test_user@gmail.com", password: "test_password")
   end

  it 'ensures character name presence' do
    character = @user.characters.build
    expect(character.save).to eq(false)
  end

  it 'ensures character name unique' do
    character = @user.characters.create!(name: "test_character_name")
    character2 = @user.characters.build(name: "test_character_name")
    expect(character2.save).to eq(false)
  end
 end
end
