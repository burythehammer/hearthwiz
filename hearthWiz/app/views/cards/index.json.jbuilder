json.array!(@cards) do |card|
  json.extract! card, :id, :name, :cost, :rarity
  json.url card_url(card, format: :json)
end
