class User
  include MongoMapper::Document

  key :name, String
  key :bio

  validates_presence_of :name

  timestamps!

  # %%DELETE%% twitter

  # %%DELETE%% github

  # %%DELETE%% facebook

  # %%DELETE%% steam

  def self.create_from_params(params)
    create!(:name => params['name'],
            :bio  => params['bio'])
  end
end
