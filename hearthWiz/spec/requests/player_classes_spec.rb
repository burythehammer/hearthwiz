require 'rails_helper'

RSpec.describe "PlayerClasses", type: :request do
  describe "GET /player_classes" do
    it "works! (now write some real specs)" do
      get player_classes_path
      expect(response).to have_http_status(200)
    end
  end
end
