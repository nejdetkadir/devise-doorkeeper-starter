# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if Rails.env.development?
  ap Doorkeeper::Application.create!(name: "Development client", redirect_uri: "", scopes: "") if Doorkeeper::Application.count.zero?
  ap User.create!(email: "test@test.com", password: "123456")
end
