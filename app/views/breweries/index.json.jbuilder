json.array!(@breweries) do |brewery|
  json.extract! brewery, :id, :name, :year
  json.num_beers brewery.beers.count
end