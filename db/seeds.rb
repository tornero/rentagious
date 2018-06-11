# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Item Categories

Category.create(name: "Dirt")
Category.create(name: "Land")
Category.create(name: "Snow")
Category.create(name: "Water")
Category.create(name: "Other")


# Item Subcategories

    # Dirt
    Subcategory.create(name: "ATVs", category_id: Category.find_by(name: "Dirt").id)
    Subcategory.create(name: "Dirt Bikes", category_id: Category.find_by(name: "Dirt").id)
    Subcategory.create(name: "Mountain Biking", category_id: Category.find_by(name: "Dirt").id)
    Subcategory.create(name: "Other Off-road Vehicles", category_id: Category.find_by(name: "Dirt").id)

    # Land
    Subcategory.create(name: "Bocce Ball", category_id: Category.find_by(name: "Land").id)
    Subcategory.create(name: "Bubble Ball", category_id: Category.find_by(name: "Land").id)
    Subcategory.create(name: "Camping Gear", category_id: Category.find_by(name: "Land").id)
    Subcategory.create(name: "Disc Golf", category_id: Category.find_by(name: "Land").id)
    Subcategory.create(name: "Horseshoes", category_id: Category.find_by(name: "Land").id)
    Subcategory.create(name: "Spikeball", category_id: Category.find_by(name: "Land").id)
    Subcategory.create(name: "Volleyball", category_id: Category.find_by(name: "Land").id)
    Subcategory.create(name: "Other Outdoor Games", category_id: Category.find_by(name: "Land").id)

    # Winter Sports
    Subcategory.create(name: "Skiing", category_id: Category.find_by(name: "Snow").id)
    Subcategory.create(name: "Snowboarding", category_id: Category.find_by(name: "Snow").id)
    Subcategory.create(name: "Snow Shoes", category_id: Category.find_by(name: "Snow").id)
    Subcategory.create(name: "Snow Mobiles", category_id: Category.find_by(name: "Snow").id)
    Subcategory.create(name: "Other Snow Sports", category_id: Category.find_by(name: "Snow").id)

    # Water Sports
    Subcategory.create(name: "Boating", category_id: Category.find_by(name: "Water").id)
    Subcategory.create(name: "Canoe", category_id: Category.find_by(name: "Water").id)
    Subcategory.create(name: "Jet Skis", category_id: Category.find_by(name: "Water").id)
    Subcategory.create(name: "Kayak", category_id: Category.find_by(name: "Water").id)
    Subcategory.create(name: "Paddle Boarding", category_id: Category.find_by(name: "Water").id)
    Subcategory.create(name: "Rafting", category_id: Category.find_by(name: "Water").id)
    Subcategory.create(name: "Rowing", category_id: Category.find_by(name: "Water").id)
    Subcategory.create(name: "Other Water Sports", category_id: Category.find_by(name: "Water").id)

    # Other
    Subcategory.create(name: "Action Cameras", category_id: Category.find_by(name: "Other").id)
    Subcategory.create(name: "Drones", category_id: Category.find_by(name: "Other").id)
    Subcategory.create(name: "Climbing", category_id: Category.find_by(name: "Other").id)
    Subcategory.create(name: "Other Outdoor Gear", category_id: Category.find_by(name: "Other").id)

