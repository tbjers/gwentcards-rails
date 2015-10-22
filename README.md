# GwentCards API

Powered by Rails, Grape, Swagger and Mongo.

[![Codeship Status for tbjers/gwentcards-rails](https://codeship.com/projects/ec700160-5aa5-0133-b365-42a590b6b454/status?branch=master)](https://codeship.com/projects/110478)

[![Coverage Status](https://coveralls.io/repos/tbjers/gwentcards-rails/badge.svg?branch=master&service=bitbucket)](https://coveralls.io/bitbucket/tbjers/gwentcards-rails?branch=master)

## Requirements

* Ruby 2.2.2
* MongoDB 3.0.x

## Setup

In order to get up and running:

```sh
$ bundle install
$ bundle exec puma
```

## Testing

Tests are written with RSpec. Most of the tests are request tests directly against the API.

Running tests:

```sh
$ bundle exec rspec spec
```

### Coverage requirements

Coverage is required to be at least 100% or deployment to the production servers will not occur.

## Contributing

♥ [gwentcards-rails](https://github.com/tbjers/gwentcards-rails) and want to contribute? Sweet! There are a few different ways you can help!

### Issue tracker

The [issue tracker](https://github.com/tbjers/gwentcards-rails/issues) is the preferred channel for [bug reports](#bugs), [feature requests](#features) and submitting [pull requests](#pull-requests); however we ask that you respect the following recommendations:

* Keep the discussion on topic and be respectful of others.
* If you think you've found a bug in Rails, Grape or Mongoid, please open an issue in their respective issue trackers.

<a name="bugs"></a>
### Bug Reports

A bug is a demonstrable problem that is caused by the code in the repository. Good bug reports are extremely helpful - thank you!

1. **Use the GitHub issue search** — check if the issue has already been reported.
2. **Check if the issue has been fixed** — try to reproduce it using the latest `master` branch in the repository.
3. **Isolate the problem** — fork the repository and create a spec in your fork.

A good bug report shouldn't leave others needing to chase you up for more information. Please try to be as detailed as possible in your report. What is your environment? What steps will reproduce the issue? What would you expect to be the outcome? All these details will help people to fix any potential bugs.

<a name="features"></a>
### Feature Requests

Feature requests are welcome. But take a moment to find out whether your idea fits with the scope and aims of the project. It's up to you to make a strong case to convince the project's developers of the merits of this feature. Please provide as much detail and context as possible.

<a name="pull-requests"></a>
### Pull Requests

Good pull requests - patches, improvements, new features - are a fantastic help. They should remain focused in scope and avoid containing unrelated commits.

**Please ask first** before embarking on any significant pull request (e.g. implementing features, refactoring code, porting to a different language), otherwise you risk spending a lot of time working on something that the project's developers might not want to merge into the project.

Please adhere to the coding conventions used throughout a project (indentation, accurate comments, etc.) and any other requirements (such as test coverage).

Adhering to the following process is the best way to get your work included in the project:

1. [Fork](https://help.github.com/articles/fork-a-repo/) the project, clone your fork, and configure the remotes:

   ```bash
   # Clone your fork of the repo into the current directory
   git clone https://github.com/<your-username>/gwentcards-rails.git
   # Navigate to the newly cloned directory
   cd gwentcards-rails
   # Assign the original repo to a remote called "upstream"
   git remote add upstream https://github.com/tbjers/gwentcards-rails.git
   ```
2. If you cloned a while ago, get the latest changes from upstream:

   ```bash
   git checkout master
   git pull upstream master
   ```
3. Create a new topic branch (off the main project development branch) to contain your feature, change, or fix:

   ```bash
   git checkout -b <topic-branch-name>
   ```
4. Commit your changes in logical chunks. Please adhere to these [git commit message guidelines](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html) or your code is unlikely be merged into the main project. Use Git's [interactive rebase](https://help.github.com/articles/about-git-rebase/) feature to tidy up your commits before making them public.
5. Locally merge (or rebase) the upstream development branch into your topic branch:

   ```bash
   git pull [--rebase] upstream master
   ```
6. Push your topic branch up to your fork:

   ```bash
   git push origin <topic-branch-name>
   ```
7. [Open a Pull Request](https://help.github.com/articles/using-pull-requests/)
    with a clear title and description.
