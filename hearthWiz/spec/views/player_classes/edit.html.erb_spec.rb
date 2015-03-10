require 'rails_helper'

RSpec.describe "player_classes/edit", type: :view do
  before(:each) do
    @player_class = assign(:player_class, PlayerClass.create!())
  end

  it "renders the edit player_class form" do
    render

    assert_select "form[action=?][method=?]", player_class_path(@player_class), "post" do
    end
  end
end
