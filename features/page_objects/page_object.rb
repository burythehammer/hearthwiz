class PageObject

  include footer_page_object
  include menu_page_object

  def ensure_subtitle_contains(text)
    within(:css, 'div.page-subtitle') do
      expect(page).to have_text(text)
    end
  end

end