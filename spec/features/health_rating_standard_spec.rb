require 'rails_helper'

feature 'HealthRatingStandard' do
  let(:file) { Rating.create(name: 'Poor', score: 0.01, weight: 2) }

  scenario 'User can import a HealthRatingStandards csv' do
    visit import_health_rating_standards_path

    expect(page).to have_css("table#records tbody tr", :count => 0)
    attach_file "ratings", "spec/fixtures/files/health_rating_standards.csv"
    click_button "Upload"

    expect(page).to have_css("table#records tbody tr", :count => 3)
  end
end
