[![View performance data on Skylight](https://badges.skylight.io/status/YXisuAn0Mhjx.svg?token=eiduhCn1sTWYwLsdC-8NcDtsPjdzfm3ISdDY64SBkps)](https://www.skylight.io/app/applications/YXisuAn0Mhjx)

# Applied Conservation

An application to help organize and plan reservation projects.

---

## Installation

#### Ruby & Rails versions

The application is tested and developed on Ruby 2.5.1 and Rails 5.2

### CONFIG KEYS

Members of the TurboCAP team can get the `config/master.key` file from another team member or you can generate your own:

```bash
ruby -rsecurerandom -e 'puts SecureRandom.hex' > config/master.key
```

This will let you edit the `config/credentials.yml.enc` file. We need to use a temporary secret key to appease Devise while we edit our credentials, so we'll set a `SECRET_KEY_BASE` environment variable for the duration of the `rails credentials:edit` command:

```bash
SECRET_KEY_BASE=abcdef rails credentials:edit
```

You don't need to put anything in this file. Rails will generate a proper `secret_key_base` for you, so you can just save and exit your editor after it loads.

### Development

To run the application locally for development follow the below commands after installing
ruby and Postgresql.

```
gem install bundler
bundle install
yarn install
bundle exec rake db:create db:schema:load db:migrate db:seed
bin/webpack
rails s
```

### JavaScript development

You can run `bin/webpack-dev-server` to run the "hot" webpack server while working
on any React components.

---

## Testing

### Ruby

Run the tests with `bin/rake` or `rspec`

### JS

Run the tests with `yarn test` or `yarn test-watch`
