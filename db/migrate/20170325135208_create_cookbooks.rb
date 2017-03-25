# frozen_string_literal: true
# :nodoc:
class CreateCookbooks < ActiveRecord::Migration[5.0]
  def change
    create_table :cookbooks do |t|
      t.string :title, null: false
      t.integer :start_page, null: false
      t.integer :end_page, null: false

      t.timestamps
    end
  end
end
