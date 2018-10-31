require 'rails_helper'

feature 'DefaultHealthRating' do
  let(:file) { Rating.create(name: 'Poor', score: 0.01, weight: 2) }

  before do
    sign_in(create(:user))
  end

  scenario 'User can import a DefaultHealthRating csv' do
    visit import_default_health_ratings_path

    expect(page).to have_css('table#records tbody tr', count: 0)
    attach_file('file_upload', 'spec/fixtures/files/default_health_ratings.csv', visible: false)
    click_button 'Upload'

    expect(page).to have_css('table#records tbody tr', count: 3)
  end
end
