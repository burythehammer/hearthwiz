require 'rails_helper'

RSpec.describe "card_sets/new", type: :view do
  before(:each) do
    assign(:card_set, CardSet.new())
  end

  it "renders new card_set form" do
    render

    assert_select "form[action=?][method=?]", card_sets_path, "post" do
    end
  end
end
