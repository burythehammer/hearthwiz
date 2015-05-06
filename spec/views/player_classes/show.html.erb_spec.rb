require 'rails_helper'

RSpec.describe 'player_classes/show', type: :view do
  before(:each) do
    @player_class = assign(:player_class, PlayerClass.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
