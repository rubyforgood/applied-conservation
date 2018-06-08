require 'rails_helper' 

feature 'Target management' do
  scenario 'User can view all targets for a Project' do
    project_name    = 'TEST PROJECT'
    target_one_name = 'TEST TARGET ONE'
    target_two_name = 'TEST TARGET TWO'

    project = Project.create(name: project_name)
    Target.create(name: target_one_name, project: project)
    Target.create(name: target_two_name, project: project)
    Target.create(name: 'NOT MY TARGET', project: Project.create)

    visit "/projects/#{project.id}"
    click_link 'View all targets'

    expect(page).to have_text(project_name)
    expect(page).to have_text(target_one_name)
    expect(page).to have_text(target_two_name)
    expect(page).not_to have_text('NOT MY TARGET')
  end
end
