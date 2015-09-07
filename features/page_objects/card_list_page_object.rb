require_relative 'page_object'


class CardListPageObject < PageObject

  PATH = '/cards'

  def go_to
    visit PATH
  end

  def ensure_is_current
    expect(current_path).to eq(self.url)
  end

  def is_card_listed(card_name)
    get_card_element(card_name).visible
  end

  def click_card(card_name)
    get_card_element(card_name).click
  end

  def get_card_element(card_id)
    page.find("li.card-box##{card_id}-box")
  end

  def get_card_info(card_id)
    page.find("div.card-box-info##{card_id}-info")
  end

  def get_card_info_words(card_id)
    /[\w]+/.match(get_card_info(card_id).text).to_a
  end

  def get_card_quality(card_id)
    get_card_info_words(card_id)[0]
  end

  def get_card_player_class(card_id)
    get_card_info_words(card_id)[1]
  end

  def get_card_type(card_id)
    get_card_info_words(card_id)[2]
  end


end