## Roda Sequel App Template

Hanami-like project structure with Roda, also featuring code reloading and autoloading via zeitwerk. (Includes tailwindcss via CDN by default)

1-To use this template first clone it to your machine e.g

git clone git@github.com:xJGBx/rodaSequelTemplate.git

2-modify the .env file accordingly

3- Uncomment .gitignore

4- Modify the model and migration files accordingly

5- run "rake db:create"

6- run  "rake db:migrate"

7- run "rake --tasks" to find available commands

8- modify router.rb accordingly

9- run "bundle exec rackup" and view in browser at http://127.0.0.1:9292 by default