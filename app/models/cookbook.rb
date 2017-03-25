# frozen_string_literal: true
# :nodoc:
class Cookbook < ApplicationRecord
  belongs_to :user
  validates :user, :title, :start_page, :end_page, presence: true
end
