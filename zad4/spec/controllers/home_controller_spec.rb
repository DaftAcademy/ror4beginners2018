require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #random" do
    it "returns http success" do
      get :random
      expect(response).to have_http_status(:success)
    end
  end

end
