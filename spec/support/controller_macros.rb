module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = User.find_by_email 'test@test.com'
      user = User.create(
        email: 'test@test.com',
        password: '12345678',
        password_confirmation: '12345678'
      ) if user.nil?
      sign_in user
    end
  end
end