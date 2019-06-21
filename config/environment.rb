require 'sinatra/activerecord'
require 'require_all'
require 'pry'
require 'colorize'
require_all 'lib'

ActiveRecord::Base.establish_connection(
    adapter: "sqlite3",
    database: "db/trivia.db"
)
ActiveRecord::Base.logger = nil