## TribeHeadz

- Which music styles are the most popular?
- Who are the most active DJs?
- Which event one should attend?

## Setup & Usage

- it is a standard Rails 3.1.0.rc1 application
- database is populated via db/seeds


## Tests

- only Rails code was tested, the import/seed script was skipped
- shoulda was used in unit tests, capybara in integration tests


## Documentation

- using TomDoc 


## The Design/Coding Process

- first the DB was created through seeding
- then the app was designed / the URL structure was mapped to resources
- then resources were created with the test-first, top-bottom approach: integration > functional > unit tests
- then design
- then refactoring


## Hackz

- could not configure the asset pipeline so symlinked assets/application.css to /public


## Wishes

- refactoring seeds.rb (create_dj, create_style, sync) to make it DRY and use some metaprogramming
