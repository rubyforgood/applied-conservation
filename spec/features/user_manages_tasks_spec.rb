require 'rails_helper'

feature 'Task management' do
  include Warden::Test::Helpers
  Warden.test_mode!
  let(:task_one_name) { 'TEST TASK 1' }
  let(:task_two_name) { 'TEST TASK 2' }
  let(:user_email) { 'blah@blah.com' }
  let(:project_name) { 'TEST PROJECT' }
  let(:project) { build(:project, name: project_name) }
  let!(:task_one) { Task.create(name: task_one_name, project: project) }
  let!(:task_two) { Task.create(name: task_two_name, project: project, user_id: '1') }
  let!(:user) { User.create(email: user_email, password: 'password', password_confirmation: 'password') }

  scenario 'User can add a new Task' do
    visit "/projects/#{project.id}"
    click_link 'Add New Task'

    fill_in('Name', with: 'NEW TASK')
    fill_in('Due on', with: '04/20/2018')
    select(user_email, from: 'task[user_id]')
    fill_in('Description', with: 'TASK DESCRIPTION')
    click_button('Add Task')

    expect(page).to have_text('NEW TASK')
    expect(current_path).to eq "/projects/#{project.id}"
  end

  scenario 'User can view all tasks for a Project' do
    visit "/projects/#{project.id}"

    expect(page).to have_text(project_name)
    expect(page).to have_text(task_one_name)
    expect(page).to have_text(task_two_name)
  end

  scenario "User can view a button for task 1 but not task 2" do
    login_as(user, scope: :user)
    visit "/projects/#{project.id}"

    expect(page).to have_selector("#pickup-task-#{task_one.id}")
    expect(page).not_to have_selector("#pickup-task-#{task_two.id}")
  end

  scenario "User can pickup task 1" do
    login_as(user, scope: :user)
    visit "/projects/#{project.id}"

    click_on("pickup-task-#{task_one.id}")
    expect(page).not_to have_selector("#pickup-task-#{task_one.id}")
    expect(page).to have_text("#{task_one_name} #{user_email}")
  end
end
