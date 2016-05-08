require "rails_helper"

RSpec.feature "Sign up", :type => :feature do
  scenario "New user signs in" do
    email = Faker::Internet.email
    password = Faker::Internet.password(8)
    visit "/users/sign_up"
    fill_in "Name",                   :with => Faker::Internet.name
    fill_in "Email",                  :with => email
    fill_in "Age",                    :with => rand(18..45)
    fill_in "Height",                 :with => rand(60..90)
    fill_in "user_password",          :with => password
    fill_in "Password confirmation",  :with => password
    click_button "Sign up"
    expect(User.last.email).to eq(email)
    expect(page).to have_text("Your Account")
  end
end
