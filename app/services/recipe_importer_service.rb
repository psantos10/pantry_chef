class RecipeImporterService < ApplicationService
  attr_reader :recipes

  def initialize(recipes:)
    @recipes = recipes
  end

  def call
    recipes.each do |recipe|
      new_recipe = Recipe.new(
        title: recipe["title"],
        category: recipe["category"].blank? ? "Other" : recipe["category"],
        image: extract_image_url(recipe["image"])
      )
      new_recipe.save!

      ingredients = recipe["ingredients"].map do |ingredient_line|
        parse_ingredient_line(ingredient_line)
      end

      ingredients.each do |ingredient|
        new_ingredient = Ingredient.find_or_initialize_by(name: ingredient[:ingredient_name])
        new_ingredient.measure_unit = ingredient[:unit]
        new_ingredient.save!

        RecipeIngredient.create(
          recipe: new_recipe,
          ingredient: new_ingredient,
          quantity: ingredient[:quantity],
          label: ingredient[:label]
        )
      end
    end
  end

  private

  def extract_image_url(recipe_image)
    image_url_parts = recipe_image.split("?url=")
    encoded_url = image_url_parts.last

    URI.decode_uri_component(encoded_url)
  end

  def parse_ingredient_line(ingredient_line)
    regex = /([\d\/\s\p{No}]+)?\s?(cup[s]?|teaspoon[s]?|tablespoon[s]?|ounce[s]?|gram[s]?|pound[s]?|milliliter[s]?|liter[s]?)?\s(.*)$/i
    regex_quantity = /([\d]+)?\s?([\p{No}]+)?\s?/i

    matches = ingredient_line.match(regex)

    name = matches.present? ? matches[3].strip : ingredient_line
    quantity_str = matches.present? ? matches[1] : nil
    unit = matches.present? ? matches[2]&.singularize : :unit
    quantity = 0

    unless quantity_str.nil?
      matches_quantity = quantity_str.match(regex_quantity)

      quantity += matches_quantity[1].to_i if matches_quantity[1].present?
      quantity += 1 if matches_quantity[2].present?
    end

    {
      quantity: quantity,
      unit:,
      ingredient_name: name.downcase,
      label: ingredient_line
    }
  end
end
