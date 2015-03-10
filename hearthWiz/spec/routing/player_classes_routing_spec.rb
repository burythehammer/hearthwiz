require "rails_helper"

RSpec.describe PlayerClassesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/player_classes").to route_to("player_classes#index")
    end

    it "routes to #new" do
      expect(:get => "/player_classes/new").to route_to("player_classes#new")
    end

    it "routes to #show" do
      expect(:get => "/player_classes/1").to route_to("player_classes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/player_classes/1/edit").to route_to("player_classes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/player_classes").to route_to("player_classes#create")
    end

    it "routes to #update" do
      expect(:put => "/player_classes/1").to route_to("player_classes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/player_classes/1").to route_to("player_classes#destroy", :id => "1")
    end

  end
end
