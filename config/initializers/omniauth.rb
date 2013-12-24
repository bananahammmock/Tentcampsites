OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, AppConfig['facebook_api_key'], AppConfig['facebook_api_secret'],
  :image_size => 'large', :scope => 'email,user_birthday,read_stream', :display => 'popup'
end