require 'rails_helper'

RSpec.describe CharactersController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  before { log_in(user) }

  describe "GET #index" do
    it "returns status ok" do
      get :index
      expect(response.status).to be(200)
    end
  end
end
