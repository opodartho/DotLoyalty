FactoryBot.define do
  factory :access_token, class: 'Doorkeeper::AccessToken' do
    application
    expires_in { 1.hours }
  end
end
