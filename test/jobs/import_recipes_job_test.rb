require "test_helper"
require "minitest/mock"

class ImportRecipesJobTest < ActiveJob::TestCase
  setup do
    @recipes_json = File.read(Rails.root.join("test", "fixtures", "files", "recipes.json"))
    @parsed_recipes = JSON.parse(@recipes_json)
  end

  test "enqueues the job with recipes as arguments" do
    assert_enqueued_with(job: ImportRecipesJob, args: [ recipes: @parsed_recipes ]) do
      ImportRecipesJob.perform_later(recipes: @parsed_recipes)
    end
  end

  test "calls RecipeImporterService and creates 3 recipes" do
    ImportRecipesJob.perform_now(recipes: @parsed_recipes)

    assert_equal 3, Recipe.count
  end
end
