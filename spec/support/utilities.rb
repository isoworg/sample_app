include ApplicationHelper

def valid_signin(user)
	fill_in "email",    with: user.email
	fill_in "password", with: user.password
	click_button "Sign in"
end

def sign_in(user)
	visit signin_path
	valid_signin(user)
	# Sign in when not using Capybara as well
	cookies[:remember_token] = user.remember_token
end

RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		page.should have_selector('div.alert.alert-error', text: message)
	end
end

RSpec::Matchers.define :have_success_message do |message|
	match do |page|
		page.should have_selector('div.alert.alert-success', text: message)
	end
end