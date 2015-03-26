require 'rails_helper'

RSpec.describe "player_classes/new", type: :view do
  before(:each) do
    assign(:player_class, PlayerClass.new())
  end

  it "renders new player_class form" do
    render

    assert_select "form[action=?][method=?]", player_classes_path, "post" do
    end
  end
end
