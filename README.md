# Blank Rails Scaffold with Continuous Integration & Development
It is well outside the scope of this README to explain the benefits of Continuous Integration and Continuous Deployment. If you're intrigued, start [here](http://www.agilemanifesto.org) and keep reading. Otherwise, here we goooooo

### Step-by-step to a scaffolded Rails app with Postgres, Travis and Coveralls:
* Create repo on GitHub. Include Rails `.gitignore` and optional `README`. Copy path to repo.
* `git clone REPO_PATH` locally where you want your project to live. Say `n` to overwrite `.gitignore` (and `README`)
* `rails new . --database=postgresql --skip-test --skip-bundle`
* `git checkout -b develop`
* `git add .`
* `git commit -m 'Initial commit'`
* In `Gemfile`, delete comments and everything in `:development, :test` and add:
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
    gem 'coveralls', require: false
end
```
-- Ok, you guys know what to do. Commit often, push up when you feel like it. Moving on. --

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
* (Optional) Create pull request template for Github:
 - `mkdir .github`
 - `touch .github/PULL_REQUEST_TEMPLATE.md`
 - Add:
    ```
     PT Story: [paste pivotal tracker link here]

    Changes proposed in this pull request:

    [item 1 - replace me]
    [item 2 - replace me]
    
    What I have learned working on this feature: [If you don't put anything here you are doing it wrong!]

    Screenshots: [If you made some visual changes to the application please upload screenshots here, or remove this section]

    Ready for review!
    ```

### Bump over to Travis to setup Continuous Integration
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
notifications:
    email: false
```
(Obviously, if you are using a different version of Ruby, you will put that version under `rvm`. And if you want a thousand emails about your builds passing or failing, don't include the last two lines.)

### Now Coveralls for code coverage

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
* `rake` will run both `rspec` and `cucumber` --> should pass with no errors, and no examples

### Continuous Deployment
* If you haven't before, you'll need to install the [Heroku Toolbelt](https://toolbelt.heroku.com/), create an account on Heroku and `heroku login` with those credentials.
* Now `heroku create APP_NAME` twice - once for a development server, once for a production server. (If you fail to specify an app name, Heroku will make one for you).
* You need to obtain your secure Heroku key and encrypt it. You can do so by:
  - `travis encrypt $(heroku auth:token) --add deploy.api_key`
  - Honestly, this has never worked for me. Instead, you an grab your Heroku key from their website and run the above line as so: `travis encrypt YOUR_HEROKU_KEY`
* Spin back up that `.travis.yml` file and add:
```
deploy:
    provider: heroku
    api_key:
      secure: YOUR_SECURE_KEY
    app:
      develop: YOUR_DEVELOPMENT_APP
      master: YOUR_PRODUCTION_APP
    on:
      repo: YOUR_GITHUB_REPO
    run:
      - "rails db:migrate"
```
Format your repo like this: `YOUR_GITHUB_NAME/PROJECT_REPO`. This setup will deploy your application after a successful build at develop or master.

##### Last step: build awesome Rails apps!!
