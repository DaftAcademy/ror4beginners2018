require 'rails_helper'

RSpec.describe TeamsController, type: :controller do

  describe "GET #get_random_teams" do
    it "returns http success" do
      get :get_random_teams
      expect(response).to have_http_status(:success)
    end
  end

end
