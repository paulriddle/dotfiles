function erp_rubocop
  docker-compose run --rm core bundle exec rubocop $argv
end
