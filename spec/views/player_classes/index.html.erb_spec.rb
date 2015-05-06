require 'rails_helper'

RSpec.describe 'player_classes/index', type: :view do
  before(:each) do
    assign(:player_classes, [
      PlayerClass.create!,
      PlayerClass.create!
    ])
  end

  it 'renders a list of player_classes' do
    render
  end
end
