require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  User.create(email: "test@email.com", password: "password")
  scenario "Can submit posts and view them" do
    visit "/"
    click_button "Login"
    fill_in "Email", with: "test@email.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    click_button "New post"
    fill_in "post[message]", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Logs in and goes to posts page" do
    visit "/"
    click_button "Login"
    fill_in "Email", with: "test@email.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    expect(current_path).to eq '/user'
  end

  scenario "View specific posts page" do
    visit "/"
    click_button "Login"
    fill_in "Email", with: "test@email.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    click_button "New post"
    fill_in "post[message]", with: "Hello, world!"
    click_button "Submit"
    click_button "View Post"
    expect(page).to have_content("Hello, world!")
  end

  # scenario "Can add comments to a post" do
  #   visit "/"
  #   click_button "Login"
  #   fill_in "Email", with: "test@email.com"
  #   fill_in "Password", with: "password"
  #   click_button "Log in"
  #   click_button "New post"
  #   fill_in "post[message]", with: "Hello, world!"
  #   click_button "Submit"
  #   click_button "View Post"
  #   fill_in "comment[comment]", with: "This is a comment"
  #   click_button "Add comment"
  #   expect(page).to have_content("This is a comment")
  # end


end
