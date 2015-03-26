require 'rails_helper'

RSpec.describe "CardSets", type: :request do
  describe "GET /card_sets" do
    it "works! (now write some real specs)" do
      get card_sets_path
      expect(response).to have_http_status(200)
    end
  end
end
