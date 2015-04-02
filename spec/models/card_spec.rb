require 'spec_helper'

RSpec.describe Card, type: :model do

	it "should be collectible" do
		card = Card.new
		card.collectible = true
		card.should be_collectible
	end


  pending "add some examples to (or delete) #{__FILE__}"
end
