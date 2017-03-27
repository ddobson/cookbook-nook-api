# Random Page API

[ERD Docs](https://github.com/ddobson/cookbook-nook-api/blob/master/cookbook_nook.pdf)

### Routes
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
