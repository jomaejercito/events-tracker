class User < ActiveRecord::Base
  has_many :venues
  has_many :events, through: :venues

  has_secure_password
  validates_presence_of :username, :email, :password
  validates :username, :uniqueness => true
  validates :email, :uniqueness => true

  def slug
    username.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    self.all.find{|i| i.slug == slug}
  end
  
end
