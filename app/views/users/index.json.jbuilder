json.array!(@users) do |user|
  json.extract! user, :name, :surname, :email, :dni, :role, :password
  json.url user_url(user, format: :json)
end
