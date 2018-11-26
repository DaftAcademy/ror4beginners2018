require 'rails_helper'

RSpec.describe TeamsController, type: :controller do

  describe "GET #create_teams" do
    it "returns http success" do
      get :create_teams
      expect(response).to have_http_status(:success)
    end
  end

end
