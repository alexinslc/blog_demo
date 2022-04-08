# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create a User
User.create(email: "admin@admin.com", password: "password", password_confirmation: "password")

# Create some posts
10.times do |i|
    Post.create(title: "Post #{i}", body: "This is the body of post #{i}", user_id: User.first.id)
end