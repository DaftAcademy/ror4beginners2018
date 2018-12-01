require 'rails_helper'

RSpec.describe TeamController, type: :controller do

  describe "GET #make_team" do
    it "returns http success" do
      get :make_team
      expect(response).to have_http_status(:success)
    end
  end

end
