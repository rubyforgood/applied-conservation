require 'rails_helper'

feature 'Task management' do
  let(:task_one_name) { 'TEST TASK 1' }
  let(:task_two_name) { 'TEST TASK 2' }
  let(:task_three_name) { 'TEST TASK 3' }
  let(:user_email) { 'blah@blah.com' }
  let(:project_name) { 'TEST PROJECT' }
  let(:project) { build(:project, name: project_name) }
  let(:user) { create(:user, email: user_email) }

  let!(:task_one) { create(:task, name: task_one_name, project: project) }
  let!(:task_two) { create(:task, name: task_two_name, project: project, user: user) }
  let!(:task_three) { create(:task, name: task_three_name, project: project, user: user, status: 'In Progress') }

  before do
    sign_in(user)
  end

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

  scenario 'User can view a button for task 1 but not task 2' do
    visit "/projects/#{project.id}"

    expect(page).to have_selector("#pickup-task-#{task_one.id}")
    expect(page).not_to have_selector("#pickup-task-#{task_two.id}")
  end

  scenario 'User can pickup task 1' do
    visit "/projects/#{project.id}"

    click_on("pickup-task-#{task_one.id}")
    expect(page).not_to have_selector("#pickup-task-#{task_one.id}")
    expect(page).to have_text("#{task_one_name} #{user_email}")
  end

  scenario 'User can mark done owned Task 3' do
    visit "/projects/#{project.id}"

    click_on("done-task-#{task_three.id}")
    expect(page).not_to have_selector("#done-task-#{task_three.id}")
    expect(page).to have_text("#{task_three.name} #{user.email} Done")
  end

  scenario 'User can mark archived owned Task 3' do
    visit "/projects/#{project.id}"

    click_on("archive-task-#{task_three.id}")
    expect(page).not_to have_selector("#archive-task-#{task_three.id}")
    expect(page).not_to have_text(task_three.name.to_s)
  end
end
