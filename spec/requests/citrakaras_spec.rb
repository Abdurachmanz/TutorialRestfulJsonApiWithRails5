require 'rails_helper'

RSpec.describe 'Citrakaras API', type: :request do
  
  let(:user) { create(:user) }
  # initialize test data 
  let!(:citrakaras) { create_list(:citrakara, 10, created_by: user.id) }
  let(:citrakara_id) { citrakaras.first.id }
  let(:headers) { valid_headers }
  # Test suite for GET /todos
  describe 'GET /citrakaras' do
    # make HTTP get request before each example
    before { get '/citrakaras', params: {}, headers: headers }

    it 'returns citrakaras' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /citrakaras/:id
  describe 'GET /citrakaras/:id' do
    before { get "/citrakaras/#{citrakara_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the citrakara' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(citrakara_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:citrakara_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Citrakara/)
      end
    end
  end

  # Test suite for POST /citrakaras
  describe 'POST /citrakaras' do
    # valid payload
    let(:valid_attributes) do
      { title: 'Learn Elm', created_by: user.id.to_s }.to_json
    end

    context 'when the request is valid' do
      before { post '/citrakaras', params: valid_attributes, headers: headers }

      it 'creates a citrakara' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { title: nil }.to_json }
      before { post '/citrakaras', params: invalid_attributes, headers: headers }
      
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
          .to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  # Test suite for PUT /citrakaras/:id
  describe 'PUT /citrakaras/:id' do
    let(:valid_attributes) { { title: 'Shopping' }.to_json }

    context 'when the record exists' do
      before { put "/citrakaras/#{citrakara_id}", headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /citrakaras/:id
  describe 'DELETE /citrakaras/:id' do
    before { delete "/citrakaras/#{citrakara_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end