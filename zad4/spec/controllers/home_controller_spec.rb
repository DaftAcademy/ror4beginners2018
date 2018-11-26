require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #team" do
    it "returns http success" do
      get :team
      expect(response).to have_http_status(:success)
    end
  end

end
