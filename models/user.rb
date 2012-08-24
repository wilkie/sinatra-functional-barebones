class User
  include MongoMapper::Document

  key :name, String
  key :bio

  validates_presence_of :name

  timestamps!
end
