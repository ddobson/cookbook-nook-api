# frozen_string_literal: true
# :nodoc:
class CookbookSerializer < ActiveModel::Serializer
  attributes :id, :title, :start_page, :end_page, :available_pages

  def available_pages
    cookbook_pages = (object.start_page..object.end_page).to_a
    recipe_pages = object.recipe_page_ranges
    object.fetch_available_pages(cookbook_pages, recipe_pages)
  end
end
