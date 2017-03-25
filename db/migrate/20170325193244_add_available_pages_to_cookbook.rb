# frozen_string_literal: true
# :nodoc:
class AddAvailablePagesToCookbook < ActiveRecord::Migration[5.0]
  def change
    change_table :cookbooks do |t|
      t.text :avail_pages, array: true, default: []
    end
  end
end
