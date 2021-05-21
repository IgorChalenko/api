require 'rails_helper'

RSpec.describe 'API', type: :request do 
  subject(:user) { create!(:user) }
    it 'creating user with valid params' do
      post api_v1_users_path, params: { user: { name: :name, email: :email, password: :password, password_confirmation: :password_confirmation } }
      expect(response.body).to include('User created')
    end


end