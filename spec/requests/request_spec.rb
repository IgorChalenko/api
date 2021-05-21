require 'rails_helper'

RSpec.describe 'API', type: :request do 

    it 'creating user with valid params' do
      headers = { "ACEPT" => 'application/json'}
      post api_v1_users_path, params: {}
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

end