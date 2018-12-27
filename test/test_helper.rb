require "simplecov"
SimpleCov.start

require "bundler/setup"
Bundler.require

require "minitest/utils"
require "minitest/autorun"
require "touch"

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: ":memory:"
)

require_relative "support/models"
