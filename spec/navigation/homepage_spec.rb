require 'rails_helper'

feature "Homepage" do
  scenario "Unregistered visitor browse homepage" do
    visit "/"
    expect(page).to have_content 'Home'
    expect(page).to have_content 'Login to Add Todo Item'
    expect(page).to have_content 'Todo List'
  end

end
