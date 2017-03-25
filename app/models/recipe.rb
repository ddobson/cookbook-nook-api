# frozen_string_literal: true
# :nodoc:
class Recipe < ApplicationRecord
  belongs_to :cookbook
  validates :name, :start_page, :end_page, presence: true
  after_save :update_available_pages
  after_destroy_commit :update_available_pages

  def update_available_pages
    @cookbook = cookbook
    cookbook_pages = (@cookbook.start_page..@cookbook.end_page).to_a
    recipe_pages = @cookbook.recipe_page_ranges
    avail_pages = @cookbook.update_available_pages(cookbook_pages, recipe_pages)
    @cookbook.update(avail_pages: avail_pages)
  end
end
