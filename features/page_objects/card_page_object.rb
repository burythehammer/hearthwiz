class CardPageObject < PageObject

  PATH = '/card/'

  def get_path(card_id)
    PATH + card_id
  end

  def go_to(card_id)
    visit get_path(card_id)
  end

  def ensure_is_current(card_id)
    expect(current_path).to eq(get_path(card_id))
  end

  def ensure_quick_info_attribute(amount, attribute)
    within(:css, "div#card-#{attribute}") do
      expect(page).to have_text(amount)
    end
  end

end