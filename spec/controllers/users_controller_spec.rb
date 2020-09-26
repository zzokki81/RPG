require("rails_helper")
RSpec.describe(UsersController, :type => :controller) do
  user = FactoryBot.create(:user)

  describe '#DELETE destroy' do
    it("not delete user") do
      expect { delete :destroy, params: {id: user.id} }.to_not change(User, :count)
    end

    it("delete user") do
      sign_in user
      expect { delete :destroy, params: {id: user.id} }.to change { User.count }.by(-1)
    end
  end
end
