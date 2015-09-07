class CardPageObject < PageObject

  include Capybara::DSL

  BASE_PATH = '/card/'

  def get_path(card_id)
    BASE_PATH + card_id
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

  def ensure_subtitle_has_text(text)
    within(:css, 'div.page-subtitle') do
      expect(page).to have_text(text)
    end
  end

  def ensure_flavour_text_is(text)
    within(:css, 'div#card-flavour-text') do
      expect(page).to have_text(text)
    end
  end

  def ensure_quick_info_class_is(text)
    within(:css, 'div#card-class') do
      expect(page).to have_text(text)
    end
  end

end