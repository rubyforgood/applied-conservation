require 'rails_helper'

feature 'Projects' do
  scenario 'user visits projects index' do
    visit root_path
    expect(page).to have_content "Projects"
  end
end
