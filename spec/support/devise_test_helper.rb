module DeviseTestHelper
  include Warden::Test::Helpers

  def login_any_user
    user = User.first || create(:user)
    login_as(user, scope: :user)
  end

  def login_user(user)
    login_as(user, scope: :user)
  end

  def current_user
    User.find(request.session[:user])
  end
end
