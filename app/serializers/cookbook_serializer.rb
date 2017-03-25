# frozen_string_literal: true
# :nodoc:
class CookbookSerializer < ActiveModel::Serializer
  attributes :id, :title, :start_page, :end_page, :avail_pages

  def avail_pages
    object.avail_pages.map(&:to_i)
  end
end
