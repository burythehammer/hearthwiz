class App

  def test_world
    test_world = TestWorld.get
  end

  def home_page
    HomePageObject.new
  end

  def card_list_page
    CardListPageObject.new
  end

  def card_page
    CardPageObject.new
  end

end