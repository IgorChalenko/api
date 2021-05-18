require 'rails_helper'

RSpec.describe 'API', type: :request do 
  let!(:user) {create_list(:user, 10)}

  describe 'GET api/v1/users' do
    before {get_json '/api/v1/users'}

    subject { response }

    it 'returns users' do
      # expect(JSON).not_to be_empty  
      expect(json.size).to eq(10)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET api/v1/users/:id' do
    before { get "/todos/#{}" }
  end
end