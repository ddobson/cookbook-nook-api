# frozen_string_literal: true
# :nodoc:
class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.references :cookbook,
                   null: false,
                   index: true,
                   foreign_key: true
      t.integer :start_page, null: false
      t.integer :end_page, null: false
      t.text :comments

      t.timestamps
    end
  end
end
