require "json/stream"

namespace :recipes do
  desc "Import recipes from JSON file"
  task import_from_json: :environment do
    file = Rails.root.join("storage", "data", "recipes-en.json")
    recipes = JSON::Stream::Parser.parse(File.open(file))

    recipes.each_slice(10) do |recipes_group|
      ImportRecipesJob.perform_later(recipes: recipes_group)
      10.times { print "." }
    end
  end
end
