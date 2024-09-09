class ImportRecipesJob < ApplicationJob
  queue_as :default

  def perform(recipes:)
    RecipeImporterService.call(recipes:)
  end
end
