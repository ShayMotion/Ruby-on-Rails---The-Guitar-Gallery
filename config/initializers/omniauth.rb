OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '3665712286818585', 'a986d227f758ac454a8f7a02018f3cae'
end