# frozen_string_literal: true
# :nodoc:
class Recipe < ApplicationRecord
  belongs_to :cookbook
  validates :name, :start_page, :end_page, presence: true
end
