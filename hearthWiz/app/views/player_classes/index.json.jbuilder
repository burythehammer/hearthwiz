json.array!(@player_classes) do |player_class|
  json.extract! player_class, :id
  json.url player_class_url(player_class, format: :json)
end
