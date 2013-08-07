Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity, fields: [:email, :name], model: User, on_failed_registration: lambda { |env| UsersController.action(:new).call(env)}
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], :scope => 'email', :display => 'popup'

end
