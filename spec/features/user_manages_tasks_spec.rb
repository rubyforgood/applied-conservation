require 'rails_helper' 

feature 'Task management' do
  before do
    @project_name    = 'TEST PROJECT'
    @task = 'TEST TASK'

    @project = Project.create(name: @project_name)
    Task.create(name: @task, project: @project)
  end

  scenario 'User can add a new Task' do
    User.create(email:'blah@blah.com', password:'password', password_confirmation:'password')
    visit "/projects/#{@project.id}"
    click_link 'Add New Task'

    fill_in('Name', with: 'NEW TASK')
    fill_in('Due on', with: '04/20/2018')
    select('blah@blah.com', from: 'task[user_id]')
    fill_in('Description', with: 'TASK DESCRIPTION')
    click_button('Add Task')

    expect(page).to have_text('NEW TASK')
    expect(current_path).to eq "/projects/#{@project.id}"
  end
end
