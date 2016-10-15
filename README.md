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
