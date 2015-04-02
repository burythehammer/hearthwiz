require "rails_helper"

RSpec.describe RaritiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/player_classes").to route_to("player_classes#index")
    end
    
    it "routes to #show" do
      expect(:get => "/player_classes/1").to route_to("player_classes#show", :id => "1")
    end

    it "doesn't route to #new" do
      expect(:get => "/player_classes/new").not_to be_routable
    end

    it "doesn't route to #edit" do
      expect(:get => "/player_classes/1/edit").not_to be_routable
    end

    it "doesn't route to #create" do
      expect(:post => "/player_classes").not_to be_routable
    end

    it "doesn't route to #update" do
      expect(:put => "/player_classes/1").not_to be_routable
    end

    it "doesn't route to #destroy" do
      expect(:delete => "/player_classes/1").not_to be_routable
    end

  end
end