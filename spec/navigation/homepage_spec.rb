require 'rails_helper'

feature "Homepage" do
  scenario "Unregistered visitor browse homepage" do
    visit "/"
    expect(page).to have_content 'Home'
    expect(page).to have_content 'Log In'
    expect(page).to have_content 'Register'
  end

end
