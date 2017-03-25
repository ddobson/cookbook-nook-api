# frozen_string_literal: true
# :nodoc:
class CookbookSerializer < ActiveModel::Serializer
  attributes :id, :title, :start_page, :end_page
end
