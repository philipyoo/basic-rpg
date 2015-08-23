require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :characters

  validates_uniqueness_of :username

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
