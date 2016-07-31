require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest

  test "the route /login actually opens the login page" do
  	get '/login'
  	assert_response :success  	
  end

  test "the route /logout actually opens the logout page" do
  	get '/logout'
  	assert_response :redirect	
  	assert_redirected_to '/'
  end

  test "the route /register actually opens the register page" do
  	get '/register'
  	assert_response :success  	
  end

end