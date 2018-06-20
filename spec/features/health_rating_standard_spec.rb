require 'rails_helper'

feature 'HealthRatingStandard' do
  let(:file) { Rating.create(name: 'Poor', score: 0.01, weight: 2) }

  scenario 'User can import a HealthRatingStandards csv' do
    # file = Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/filename.xlsx"))
    # save_uploaded_file_to_db(file)

    visit import_health_rating_standards_path

    expect(page).to have_css("div.records li", :count => 0)
    attach_file "ratings", "spec/fixtures/files/health_rating_standards.csv"
    click_button "Upload"

    expect(page).to have_css("div.records li", :count => 3)
  end
end
