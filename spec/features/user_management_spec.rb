require 'rails_helper'

describe 'User Management', js: true do
  let!(:user) { create(:user) }
  before do
    login_user(user)
    visit root_path
  end

  it 'User can sign out' do
    page.find('.user-dropdown').hover
    expect(page.find('.user-dropdown-content')).to have_content user.email

    click_link 'sign-out-link'
    expect(page.find('h2')).to have_content 'Log in'
  end

  describe 'admin panel' do
    it 'admins can access the admin panel' do
      page.find('.user-dropdown').hover
      click_link 'Admin'
    end

    it 'non-admins cannot access the admin panel'
  end
end
