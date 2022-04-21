# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/entities', type: :request do
  before(:each) do
    sign_in User.first
    get group_entities_path(Group.first)
  end

  describe 'GET /entities' do
    it 'is working! Returns correct status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'is working!  renders index view correctly' do
      expect(response).to render_template(:index)
    end

    it 'is working! reponse body includes Group 1' do
      expect(response.body).to include('TRANSACTIONS')
    end
  end
end
