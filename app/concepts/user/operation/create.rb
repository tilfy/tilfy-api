class User::Operation::Create < Application::Operation::Base
  GOOGLE_API_URL = 'https://www.googleapis.com/oauth2/v3/tokeninfo?id_token='

  step :fetch_google_api
  step :model!
  step :create_token!

  def fetch_google_api(options, params:, **)
    response = RestClient.get(GOOGLE_API_URL + params[:id_token])
    options['data'] = JSON.parse(response)
  end

  def model!(options, **)
    options[:model] = User.find_or_initialize_by(email: options['data']['email']).tap do |user|
      user.email = options['data']['email']
      user.password = Devise.friendly_token[0,20]
      user.name = options['data']['name']
      user.provider = 'google_oauth2'
      user.uid = options['data']['email']
    end
  end

  def create_token!(options, model:, **)
    options[:token] = model.create_new_auth_token
    options[:token]['uid'] = model.uid
  end
end
