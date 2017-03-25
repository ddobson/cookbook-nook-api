# frozen_string_literal: true
#
# This data can then be loaded with the rake db:examples cmd
# or created alongside the db with db:nuke_pave.
#

user_params = { email: 'dale@dale', password: 'pass' }

User.create(user_params)

(1..5).each do |n|
  user = User.first
  cookbook_params = {
    title: "Sample Cookbook #{n}",
    start_page: 4,
    end_page: 100
  }
  @cookbook = user.cookbooks.build(cookbook_params)
  @cookbook.save
end

Cookbook.all.each_with_index do |book, i|
  recipe_params = {
    name: "Sample Recipe #{i + 1}",
    start_page: (i + 1) * (i + 1),
    end_page: (i + 1) * (i + 2),
    comments: 'This recipe was killer!'
  }
  @recipe = book.recipes.build(recipe_params)
  @recipe.save
end
