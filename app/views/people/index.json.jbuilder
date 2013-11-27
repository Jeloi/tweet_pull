json.array!(@people) do |person|
  json.extract! person, :number, :name, :username, :class, :label_number
  json.url person_url(person, format: :json)
end
