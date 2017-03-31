# frozen_string_literal: true
# :nodoc:
class CookbookSerializer < ActiveModel::Serializer
  attributes :id, :title, :start_page, :end_page, :avail_pages, :recipes

  def avail_pages
    object.avail_pages.map(&:to_i)
  end

  def recipes
    object.recipes.map do |recipe|
      {
        id: recipe.id,
        name: recipe.name,
        start_page: recipe.start_page,
        end_page: recipe.end_page
      }
    end
  end
end
