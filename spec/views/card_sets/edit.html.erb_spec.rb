require 'rails_helper'

RSpec.describe "card_sets/edit", type: :view do
  before(:each) do
    @card_set = assign(:card_set, CardSet.create!())
  end

  it "renders the edit card_set form" do
    render

    assert_select "form[action=?][method=?]", card_set_path(@card_set), "post" do
    end
  end
end
