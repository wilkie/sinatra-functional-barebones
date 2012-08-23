class Application
  configure :test do
    MongoMapper.database = "application_test"
  end

  configure :development do
    MongoMapper.database = "application_development"
  end
end
