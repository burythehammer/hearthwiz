require 'rails_helper'

RSpec.describe 'card_sets/show', type: :view do
  before(:each) do
    @card_set = assign(:card_set, CardSet.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
