require "sqlite3"
require_relative "task"

DB = SQLite3::Database.new("tasks.db")
DB.results_as_hash = true


p Task.all
