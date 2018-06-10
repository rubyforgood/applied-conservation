require 'rails_helper' 

feature 'Task management' do
  include Warden::Test::Helpers
  Warden.test_mode!
  task_one_name = 'TEST TASK 1'
  task_two_name = 'TEST TASK 2'
  task_three_name = 'TEST TASK 3'

  before do
    @project_name = 'TEST PROJECT'
    @user = User.create(email:'blah@blah.org', password:'password', password_confirmation:'password')
    login_as(@user, scope: :user)

    @project = Project.create(name: @project_name)
    @task_one = Task.create(name: task_one_name, project: @project)
    @task_two = Task.create(name: task_two_name, project: @project, user_id: '1')
    @task_three = Task.create(name: task_three_name, project: @project, user_id: @user.id, status:'In Progress')
  end

  scenario 'User can add a new Task' do
    visit "/projects/#{@project.id}"
    click_link 'Add New Task'

    fill_in('Name', with: 'NEW TASK')
    fill_in('Due on', with: '04/20/2018')
    select(@user.email, from: 'task[user_id]')
    fill_in('Description', with: 'TASK DESCRIPTION')
    click_button('Add Task')

    expect(page).to have_text('NEW TASK')
    expect(current_path).to eq "/projects/#{@project.id}"
  end

  scenario 'User can view all tasks for a Project' do
    visit "/projects/#{@project.id}"

    expect(page).to have_text(@project_name)
    expect(page).to have_text(task_one_name)
    expect(page).to have_text(task_two_name)
  end

  scenario "User can view a button for #{task_one_name} but not #{task_two_name}" do
    visit "/projects/#{@project.id}"

    expect(page).to have_selector("#pickup-task-#{@task_one.id}")
    expect(page).not_to have_selector("#pickup-task-#{@task_two.id}")
  end

  scenario "User can pickup #{task_one_name}" do
    visit "/projects/#{@project.id}"

    click_on("pickup-task-#{@task_one.id}")
    expect(page).not_to have_selector("#pickup-task-#{@task_one.id}")
    expect(page).to have_text("#{task_one_name} #{@user.email}")
  end
  
  scenario "User can mark done owned #{task_three_name}" do
    visit "/projects/#{@project.id}"

    click_on("done-task-#{@task_three.id}")
    expect(page).not_to have_selector("#done-task-#{@task_three.id}")
    expect(page).to have_text("#{@task_three.name} #{@user.email} Done")
  end  
  
  scenario "User can mark archived owned #{task_three_name}" do
    visit "/projects/#{@project.id}"

    click_on("archive-task-#{@task_three.id}")
    expect(page).not_to have_selector("#archive-task-#{@task_three.id}")
    expect(page).not_to have_text("#{@task_three.name}")
  end    
end
