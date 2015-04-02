require "rails_helper"

RSpec.describe CardSetsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/cards/sets").to route_to("card_sets#index")
    end
    
    it "routes to #show" do
      expect(:get => "/cards/set/set_name").to route_to("card_sets#show", :name => "set_name")
    end

    # make sure resources aren't set up

    it "doesn't route to #new" do
      expect(:get => "/card_sets/new").not_to be_routable
    end

    it "doesn't route to #edit" do
      expect(:get => "/card_sets/1/edit").not_to be_routable
    end

    it "doesn't route to #create" do
      expect(:post => "/card_sets").not_to be_routable
    end

    it "doesn't route to #update" do
      expect(:put => "/card_sets/1").not_to be_routable
    end

    it "doesn't route to #destroy" do
      expect(:delete => "/card_sets/1").not_to be_routable
    end

  end
end
