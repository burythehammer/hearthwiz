require "rails_helper"

RSpec.describe PlayerClassesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/player_classes").to route_to("player_classes#index")
    end
    
    it "routes to #show" do
      expect(:get => "/player_classes/1").to route_to("player_classes#show", :id => "1")
    end

  end
end
