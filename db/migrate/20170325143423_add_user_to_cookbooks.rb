class AddUserToCookbooks < ActiveRecord::Migration[5.0]
  def change
    add_reference :cookbooks, :user, null: false, foreign_key: true
  end
end
