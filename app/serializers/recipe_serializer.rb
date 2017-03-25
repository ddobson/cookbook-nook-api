# frozen_string_literal: true
# :nodoc:
class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :cookbook_id, :start_page, :end_page, :comments
end
