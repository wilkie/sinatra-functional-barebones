class User
  include MongoMapper::Document

  key :name, String
  key :bio

  validates_presence_of :name

  timestamps!

  def self.create_from_params(params)
    create!(:name => params['name'],
            :bio  => params['bio'],
            :hashed_password => User.hash_password(params['password']))
  end

  key :hashed_password, String

  def self.hash_password(password)
    BCrypt::Password.create(password, :cost => Application::BCRYPT_ROUNDS)
  end

  def authenticated?(password)
    BCrypt::Password.new(hashed_password) == password
  end
end
