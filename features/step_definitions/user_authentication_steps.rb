Given('I visit the homepage') do
  visit root_path
end

Given('I click sign up and fill in the form') do
  click_on 'sign-up'
  fill_in 'user_email', with: 'user@yahoo.com'
  fill_in 'user_username', with: 'username'
  fill_in 'user_password', with: 'password'
  fill_in 'user_password_confirmation', with: 'password'
end

Given('I should be signed up') do
  visit root_path
end

Given('I am a registered user') do
  @user = FactoryBot.create(:user,
                            email: 'user@yahoo.com',
                            username: 'username',
                            password: 'password')
end

When('I fill in the login form') do
  click_on 'login'
  visit '/users/sign_in'
  fill_in 'user_email', with: 'user@yahoo.com'
  fill_in 'user_password', with: 'password'
  click_button 'Log in'
end

Given('I should be logged in') do
  visit root_path
end

When('I click the log out button') do
  click_on 'logout'
end
