require 'rails_helper'

RSpec.describe CardsController, type: :routing do
  describe 'Card Routing' do

    it 'routes card list page' do
      expect(get: '/cards').to route_to(
        controller: 'cards',
        action: 'index')
    end

    it 'routes card page with id' do
      expect(get: '/cards/id/FP1_009').to route_to(
        controller: 'cards',
        action: 'show_by_id',
        id: 'FP1_009')
    end

    it 'routes card page with name' do
      expect(get: '/cards/name/Deathlord').to route_to(
        controller: 'cards',
        action: 'show_by_name',
        name: 'Deathlord')
    end

    # make sure resources aren't set up

    it "doesn't route to #new" do
      expect(get: '/cards/new').not_to be_routable
    end

    it "doesn't route to #edit" do
      expect(get: '/cards/1/edit').not_to be_routable
    end

    it "doesn't route to #create" do
      expect(post: '/cards').not_to be_routable
    end

    it "doesn't route to #update" do
      expect(put: '/cards/1').not_to be_routable
    end

    it "doesn't route to #destroy" do
      expect(delete: '/cards/1').not_to be_routable
    end
  end
end
