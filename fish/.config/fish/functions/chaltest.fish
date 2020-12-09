function chaltest
  docker-compose run -e DATABASE_URL=postgresql://postgres@db/challenge_test -e RAILS_ENV=test -e SPEC_DISABLE_FACTORY_LINT=true -e SPEC_DISABLE_WEBPACK_COMPILE=true --rm challenge rspec $argv
end
