class User
  include MongoMapper::Document

  key :name
  key :bio

  timestamps!
end
