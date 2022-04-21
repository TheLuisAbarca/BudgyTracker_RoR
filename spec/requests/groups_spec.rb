# frozen_string_literal: true

require 'rails_helper'
RSpec.describe '/groups', type: :request do
  before(:each) do
    sign_in User.first
    get groups_path
  end

  describe 'GET /groups' do
    it 'is working! Returns correct status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'is working!  renders index view correctly' do
      expect(response).to render_template(:index)
    end

    it 'is working! reponse body includes Group 1' do
      expect(response.body).to include('CATEGORIES')
    end
  end
end
