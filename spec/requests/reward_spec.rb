# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Rewards', type: :request do
  describe 'GET /reward_list' do
    it 'returns http success' do
      get '/reward/reward_list'
      expect(response).to have_http_status(:success)
    end
  end
end
