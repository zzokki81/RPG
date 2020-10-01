Then('I click on characters page') do
  click_on 'all-characters'
  visit '/characters'
end

When('I click on create new character') do
  click_on 'new-character'
  visit '/characters/new'
end

When('I create new character') do
  @character = FactoryBot.create(:character,
                                 user: @user,
                                 name: 'Char')
end

Then('I have created a new character') do
  visit '/characters'
  expect(page).to have_content('Char')
end

When('I edit character') do
  click_on 'edit-character'
  fill_in 'character_name', with: 'Char edited'
  click_on 'update-character'
end

Then('I edited my character') do
  expect(page).to have_content('Char edited')
end

Then('I click to delete the character') do
  visit '/characters'
  click_on 'delete-character'
  expect(page).to_not have_content('Test')
end
