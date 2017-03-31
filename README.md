# CookbookNook API

[Client Repo](https://github.com/ddobson/cookbook-nook)

[Client App](http://cookbook-nook.surge.sh/)

[Production API](https://cook-book-nook-api.herokuapp.com/)

[ERD: ](https://github.com/ddobson/cookbook_nook_api/blob/master/cookbook_nook.pdf)

## Routes

| Method | URL | Action |
|--------|-----|--------|
| GET | `/cookbooks` | `cookbooks#index` |
| GET | `/cookbooks/:id` | `cookbooks#show` |
| POST | `/cookbooks` | `cookbooks#create` |
| PATCH | `/cookbooks/:id` | `cookbooks#edit` |
| DELETE | `/cookbooks/:id` | `cookbooks#destroy` |
| GET | `/cookbooks/:id/recipes` | `recipes#index` |
| POST | `/cookbooks/:id/recipes` | `recipes#create` |
| GET | `/recipes/:id` | `recipes#show` |
| PATCH | `/recipes/:id` | `recipes#edit` |
| DELETE | `/recipes/:id` | `recipes#destroy` |

## Approach
When building the API I started with the simplest implementation possible to supply the client with the needed data. Both the `Cookbook` and `Recipe` resources were initially generated using Rails scaffold and then tweaked to suit my needs. I tested both resources indepedently using CURL scripts and then began testing again after associating the resources. Code for determining available pages was added last with a few tweaks to the original formula as the client app began to take shape.

## Installation

After cloning the repo you can install all dependencies using:
```
bundle install
```

## Technology
- Ruby on Rails
- PostgreSQL
- Heroku
- Git

## Hurdles
When building the API for CookbookNook the biggest challenge was calculating and storing the array of available pages. To handle this I added the following code to the model of `Cookbook`.

``` ruby
def recipe_page_ranges
  recipes = self.recipes
  recipes.map do |recipe|
    start_page = recipe.start_page
    end_page = recipe.end_page
    (start_page..end_page)
  end
end

def update_available_pages(pages, recipe_ranges)
  recipe_ranges.each do |range|
    indexes = build_page_indexes(pages, range)
    next if indexes.length.zero?
    slice_range = (indexes[0]..indexes[-1])
    pages.slice!(slice_range)
  end
  pages
end

private

def build_page_indexes(pages, range)
  indexes = range.map do |n|
    pages.index(n)
  end
  indexes.compact.sort
end
```

This code builds an array of pages by making a range from the start and end pages of a cookbook and then reconciling that array with the range of pages on each recipe. The result is then stored as an array in the database. Using Rails callback hooks I then update that array anytime a recipe is created, destroyed or updated.
