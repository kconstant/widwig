class User < ActiveRecord::Base
  has_and_belongs_to_many :tasks
  require 'digest/sha2'
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  attr_accessor :password_confirmation
  validates_confirmation_of :password
  
  attr_accessor :password
  def validate
    errors.add_to_base("Missing password") if password_hash.blank?
  end
  
  def password
    @password
  end
  
  def password=(pwd)
    @password = pwd
    create_new_salt
    self.password_hash = User.encrypted_password(self.password, self.password_salt)
  end
  
  def self.authenticate(name, password)
    user = User.find_by_name(name)
    if user
      expected_password = encrypted_password(password, user.password_salt)
      if user.password_hash != expected_password
        user = nil
      end
    end
    user
  end
  
  private
  
  def self.encrypted_password(password, password_salt)
    string_to_hash = password + "widwig" + password_salt
    Digest::SHA256.hexdigest(string_to_hash)
  end
  
  def create_new_salt
    self.password_salt = self.object_id.to_s + rand.to_s
  end
end
