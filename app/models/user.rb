class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String
  field :password, type: String
  field :lastName, type: String
  field :location, type: String
  field :created_at, type: Time, default: Time.now
  field :updated_at, type: Time, default: Time.now

  validates_presence_of :name, :email, :password
  validates_uniqueness_of :email

  validates :name, length: { minimum: 3, maximum: 20 }
  validates :password, length: { minimum: 5 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

end