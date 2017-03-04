# Snack!
### A social media platform for connecting with other language learners. Gothenburg, Sweden only for now.
___________

### Deployed
You can see a working copy at [snackar.herokuapp.com](https://snackar.herokuapp.com)

[![Coverage Status](https://coveralls.io/repos/github/AmberWilkie/snack-app/badge.svg?branch=develop)](https://coveralls.io/github/AmberWilkie/snack-app?branch=users)

### Built With
- Rails
- HAML
- Devise
- ZURB Foundation
- [`has_friendship`](https://github.com/sungwoncho/has_friendship)
- [`acts_as_taggable_on`](https://github.com/mbleigh/acts-as-taggable-on)
- Faker
- Cucumber / Capybara
- Rspec
- Travis
- Coveralls

## Props To
- Dana Mulder, who wrote this [lovely messaging tutorial](https://medium.com/@danamulder/tutorial-create-a-simple-messaging-system-on-rails-d9b94b0fbca1#.t14w0ok4b). It was a great jumping-off point for what I really needed.

## To Do
- ~~Add languages for users~~
- ~~Install `has_friendship` so users can friend each other~~
- ~~Deploy app for staging / testing~~
- ~~Users can find others whose languages match up~~
- ~~Install a messaging service so users can message each other~~
- ~~Style and sanitize params for login, edit user registration~~
- ~~Create a nav bar~~
- Get Foundation Javascript working for a "real" nav bar
- Create forums so users can post publicly
- Install an admin interface so users and forum posts can be monitored for inappropriate activity
- Research security settings and make sure user data is not compromisable
- Add photos for users
- Install i18n translation for at least Swedish, hopefully other languages too (will need help - Arabic, anyone?)
- Style flash messages
- Users' language list should be links to lists of users who speak / want to speak those languages
- Production deployment to Digital Ocean
- Language and Learning lists need to populate with the values already in the database (on the edit profile form).
- ~~Refactor messaging to use helpers like `user.conversations`~~
- Unit test helper methods.