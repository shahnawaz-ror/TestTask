# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PointHistories', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/point_history/index'
      expect(response).to have_http_status(:success)
    end
  end
end
