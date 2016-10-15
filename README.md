# Blank Rails Scaffold with Continuous Integration & Development
#### Plus, bonus Ionic scaffold

### Step-by-step to a scaffolded Rails app with Postgres, Travis and Coveralls:
* Create repo on GitHub. Include Rails `.gitignore` and optional `README`. Copy path to repo.
* `git clone REPO_PATH` locally where you want your project to live. Say `n` to overwrite `.gitignore` (and `README`)
* `rails new . --database=postgresql --skip-test --skip-bundle`
* `git checkout -b develop`
* `git add .`
* `git commit -m 'Initial commit'`
* In `Gemfile`, delete everything in `:development, :test` and add:
```
group :development, :test do
    gem 'listen', '~> 3.0.5'
    gem 'rspec-rails'
    gem 'shoulda-matchers'
    gem 'factory_girl_rails'
    gem 'pry'
    gem 'pry-byebug'
    gem 'cucumber-rails', require: false
    gem 'database_cleaner'
end
```
* Delete the Windows gem at the bottom if you're not working in Windows
* `bundle install`
* `bundle exec rails generate rspec:install`
* In `.rspec`: `--format documentation`
* Remove unnecessary comments from `rails_helper` and `spec_helper`. Add to `rails_helper` inside `RSpec.configure`:
```
Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
end
```
* In `config/application.rb` remove comments and add inside `class Application`:
```
config.generators do |generate|
    generate.helper false
    generate.assets false
    generate.view_specs false
    generate.helper_specs false
    generate.routing_specs false
    generate.controller_specs false
end
config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
end
config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
end
```
* `bundle exec rspec` --> this should work now and return no errors (and also no tests, because you haven't written any)
* `bundle exec rails generate cucumber:install`
* `rails db:create --all`
* `rails db:migrate --all`
* `bundle exec cucumber` -> should not error and find no examples

#### Bump over to Travis and Coveralls to setup Continuous Integration / Code Coverage
* Visit [Travis-ci.org](http://www.travis-ci.org):
  - Sign up or whatever you have to do.
  - Hit the little `+` next to `My Repositories`
  - Flip the switch on the repository you just created
* Create a file in the root of your folder called `.travis.yml`. Add:
```
language: ruby
rvm:
  - 2.3.0
before_script:
  - bundle exec rake db:create --all
  - bundle exec rake db:migrate
script:
  - bundle exec rake ci:tests
services:
  - postgresql
```
(obviously, if you are using a different version of Ruby, you will put that version under `rvm`)
* Create `lib/tasks/ci.rake`. Add:
```
unless Rails.env.production?
    require 'rspec/core/rake_task'
    require 'cucumber/rake/task'
    require 'coveralls/rake/task'

    Coveralls::RakeTask.new

    namespace :ci do
      desc 'Run all tests and generate a merged coverage report'
      task tests: [:spec, :cucumber, 'coveralls:push']
    end
end
```
* Create `.simplecov` in root folder. Add:
```
SimpleCov.start 'rails'
```
* Visit `coveralls.io`:
  - Sign up or whatever.
  - Hit the plus sign, then flip the switch on your new repo. (You probably have to refresh to see it.)
* At the very top of `spec_helper`:
```
require 'coveralls'
Coveralls.wear!
```
* Create `/features/support/env.rb`. Delete comments. Add:
```
require 'coveralls'
Coveralls.wear_merged!("rails")
```
