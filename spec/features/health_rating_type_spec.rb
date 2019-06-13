require 'rails_helper'

feature 'Health rating type management', js: true do
  before do
    sign_in(create(:user, admin: true))
  end

  describe 'health rating types' do
    it 'admins can create health rating types' do
      visit root_path

      page.find('.user-dropdown').hover
      click_link 'Admin'
      click_link 'Health Rating Types'

      click_link 'New Health Rating Type', visible: false
      fill_in 'Name', with: 'New Health Rating Type!'
      click_button 'Create Health rating type'

      expect(page.find('.flash_notice')).to have_content "Health rating type was successfully created."

      # expect(page).to have_css('table#records tbody tr', count: 1)
    end
  end
end