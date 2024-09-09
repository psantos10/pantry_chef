class ActionDispatch::IntegrationTest
  def login_as(user)
    if respond_to?(:click_on)
      visit login_url
      fill_in "E-mail address", with: user.email
      fill_in "Password", with: "password"
      click_on "Sign in"

      find "button", text: "Logout"
    else
      post login_url, params: { email: user.email, password: "password" }
    end
  end
end
