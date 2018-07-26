require 'rails_helper'

describe 'User Management', js: true do
  it 'User can sign in and sign out' do
    user = create(:user)
    sign_in(user)
    visit root_path

    page.find('.user-dropdown').hover
    expect(page.find('.user-dropdown-content')).to have_content user.email

    click_link 'sign-out-link'
    expect(page.find('h2')).to have_content 'Log in'
  end

  describe 'admin panel' do
    it 'admins can access the admin panel' do
      admin = create(:user, admin: true)
      sign_in(admin)
      visit root_path

      page.find('.user-dropdown').hover
      click_link 'Admin'
      expect(current_path).to eq admin_dashboard_path
    end

    it 'non-admins cannot access the admin panel' do
      non_admin = create(:user, admin: false)
      sign_in(non_admin)
      visit root_path

      page.find('.user-dropdown').hover
      expect(page).to_not have_content 'Admin'
    end
  end
end
