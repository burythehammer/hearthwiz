require 'rails_helper'

RSpec.describe 'card_sets/index', type: :view do
  before(:each) do
    assign(:card_sets, [
      CardSet.create!(),
      CardSet.create!()
    ])
  end

  it 'renders a list of card_sets' do
    render
  end
end
