[![View performance data on Skylight](https://badges.skylight.io/status/YXisuAn0Mhjx.svg?token=eiduhCn1sTWYwLsdC-8NcDtsPjdzfm3ISdDY64SBkps)](https://www.skylight.io/app/applications/YXisuAn0Mhjx)

# Applied Conservation

An application to help organize and plan reservation projects.

---

## Instalation

#### Ruby & Rails versions

The application is tested and developed on Ruby 2.5.1 and Rails 5.2

### CONFIG KEYS

To run the application locally you must get the `config/master.key` file or setup your
own local SECRET_KEY.

### Development

To run the application locally for development follow the below commands after installing
ruby and Postgresql.

```
gem install bundler
bundle install
yarn
bundle exec rake db:create db:schema:load db:migrate
bin/webpack
rails s
```

### Javascript development

You can run `bin/webpack-dev-server` to run the "hot" webpack server while working
on any React components.

---

## Testing

### Ruby

Run the tests with `bin/rake` or `rspec`

### JS

Run the tests with `yarn test` or `yarn test-watch`

