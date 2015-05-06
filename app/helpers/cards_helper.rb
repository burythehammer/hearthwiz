module CardsHelper
  def render_quickinfo(info)
    render partial: 'layouts/quickinfo', locals: { attribute: info }
  end
end
