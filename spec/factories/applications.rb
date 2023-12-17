FactoryBot.define do
  factory :application, class: 'Doorkeeper::Application' do
    name { 'Android Client' }
  end
end
