# frozen_string_literal: true
class User < ApplicationRecord
  include Authentication
  has_many :cookbooks
  has_many :examples
end
