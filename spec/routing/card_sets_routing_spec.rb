require "rails_helper"

RSpec.describe CardSetsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/card_sets").to route_to("card_sets#index")
    end

    it "routes to #new" do
      expect(:get => "/card_sets/new").to route_to("card_sets#new")
    end

    it "routes to #show" do
      expect(:get => "/card_sets/1").to route_to("card_sets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/card_sets/1/edit").to route_to("card_sets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/card_sets").to route_to("card_sets#create")
    end

    it "routes to #update" do
      expect(:put => "/card_sets/1").to route_to("card_sets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/card_sets/1").to route_to("card_sets#destroy", :id => "1")
    end

  end
end
