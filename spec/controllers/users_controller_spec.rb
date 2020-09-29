require("rails_helper")
RSpec.describe(UsersController, :type => :controller) do
  user = FactoryBot.create(:user)

  describe 'GET #profile' do
    it("will find user") do
      get :profile, params: {id: user.id}
      expect(response.status).to be(200)
    end
    it("will not find user") do
      get :profile, params: {id: 'foo'}
      expect(response).to redirect_to root_path
    end
  end
end
