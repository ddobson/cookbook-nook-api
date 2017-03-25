# frozen_string_literal: true
# :nodoc:
class Cookbook < ApplicationRecord
  belongs_to :user
  has_many :recipes
  validates :user, :title, :start_page, :end_page, presence: true

  def recipe_page_ranges
    recipes = self.recipes
    recipes.map do |recipe|
      start_page = recipe.start_page
      end_page = recipe.end_page
      (start_page..end_page)
    end
  end

  def fetch_available_pages(pages, recipe_ranges)
    recipe_ranges.each do |range|
      indexes = build_page_indexes(pages, range)
      next if indexes.length.zero?
      slice_range = (indexes[0]..indexes[-1])
      pages.slice!(slice_range)
    end
    pages
  end

  private

  def build_page_indexes(pages, range)
    indexes = range.map do |n|
      pages.index(n)
    end
    indexes.compact.sort
  end
end
