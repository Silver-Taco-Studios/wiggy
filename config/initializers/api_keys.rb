module Constants
  file = File.read(Rails.root + "config/initializers/api_keys.json")
  API_KEYS = JSON.parse(file)
end
