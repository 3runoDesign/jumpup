# Changelog

## 0.0.8 (unreleased)

### features
- Abort integration if a new commit appears between spec and push tasks. You can use it running `git:store_last_commit_hash` on the beginning of integration (already on `jumpup:start`) and `git:check_last_commit_change` before pushing.

### improvements

### bug fixes

## 0.0.7 (September 15, 2014)

### features
- Implements tasks jumpup:integration:check, jumpup:integration:lock, jumpup:integration:unlock to block a user from integrating while another one is already integrating at same time. It is useful when the project have a lot of tests because it avoids the second user to receive the reject message from git, and have to run all tests again.
- Add quiet git messages on rake integrate.

### improvements
- Add tests with rspec and aruba

### bug fixes
- Delete integrating local tag before fetching remote tags
- Fix "uninitialized constant Jumpup::GitCommand::Rake"

## 0.0.6 (July 11, 2014)

### features

### improvements
- Transfer coverage verification to simplecov

### bug fixes


## 0.0.5 (May 15, 2014)

### features

### improvements

### bug fixes
- Fix warning message about `RAILS_ENV` on rails `>= 4.1`
- Fix the coverage verify to works on Rails `>= 4.1`

## 0.0.4 (February 21, 2014)

### features

### improvements

- Create a CONTRIBUTING file
- Add info about how release the gem
- Add info about issues
- Add info about contributing
- Add info about credits

### bug fixes

- Fix bundle install on bundler 1.5.2 when have gems from github

## 0.0.3 (January 17, 2014)

### features

### improvements

- Name correct tasks on README
- Add rake dependency as 0

### bug fixes

- Fix coverage that dont stop the integrate

## 0.0.2 (January 8, 2014)

### features

### improvements

- Remove hpricot dependency
- Test against ```coverage/.last_run.json``` file
- Renamed namespace `integration` to `jumpup` file

### bug fixes

## 0.0.1 (August 06, 2013)

### features

- Changed integration to a gem named Jumpup

### improvements

### bug fixes

## Previous

The changelog began with version 0.0.1 so any changes prior to that
can be seen by reading old git commit messages or with the original version of [integration](https://github.com/tapajos/integration) release notes below.

### Release Notes

* Version 0.3.0 - Remove old svn support. Add support for Simplecov on Ruby 1.9.
* Version 0.2.4 - Added support for git and git-svn. Thanks to [Sylvestre Mergulhão][sm] and [Eduardo Fiorezi][edu].
* Version 0.2.3 - BUG FIX: Rake db:migrate fails when default RAILS\_ENV is used. Thanks to Celestino Gomes for fix this bug.
* Version 0.2.2 - Removed vendor/plugins/* commit. This commit is necessary when use plugins with externals but it is not a good practice. Piston is the correct way to use externals plugins. If you want to use externals commit in your integration process you can create a svn:commit:after task.
* Version 0.2.1 - BUG FIX: Setting 'RAILS\_ENV' wasn't affecting migrations. This bug fix changes this behavior and makes sure that 'RAILS_ENV' set by the user will always be respected, for all tasks. Thanks to Sylvestre Mergulhão for point this out.
* Version 0.2   - Added support for SKIP\_COMMIT\_MESSAGES'.

[edu]:  http://about.me/eduardofiorezi
[sm]:   https://github.com/mergulhao
