th
==


commands
---------
bundle install --binstubs --path vendor/bundle

rails generate migration CreateCategories


commands
---------

heroku run rake db:migrate

ruby -Itest test/functional/categories_controller_test.rb -n test_get_many



curl -i "http://localhost:3000/categories?ids%5b%5d=1&ids%5b%5d=3"


TODO
-------
startDate-endDate -->  filters
