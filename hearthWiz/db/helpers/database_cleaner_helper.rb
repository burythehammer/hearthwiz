
# ensures database is clean before starting 
def clean_database

  begin
    # start off entire run with with a full truncation
    DatabaseCleaner.clean_with :truncation

    # continue with the :transaction strategy to be faster while running tests.
    DatabaseCleaner.strategy = :transaction
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end

end