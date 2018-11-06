require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get "/"
    assert_response :success
  end

  test "navbar links to home" do
    get root_path
    assert_select 'nav a[href=?]', root_path
  end

  test "navbar links to register" do
    get root_path
    assert_select 'nav a[href=?]', '/register/new'
  end

  test "navbar links to login" do
    get root_path
    assert_select 'nav a[href=?]', '/login'
  end

  test "navbar no private_club link on logout" do
    get root_path
    assert_select 'nav a[href=?]', 'https://www.youtube.com', false
  end

  test "navbar private_club link on login" do
    user = User.create(
      first_name: 'test',
      last_name: 'test',
      email: 'test@test.com'
    )
    post '/login', params: {"user" => {email: 'test@test.com', first_name: 'test', last_name: 'test'}}
    assert flash[:success] = "Vous êtes bien enregistré !"
  end
end
