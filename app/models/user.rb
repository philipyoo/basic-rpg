require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :characters

  validates_uniqueness_of :username
  validates :username, presence: true
  validates :password_hash, presence: true, confirmation: true


  # bcrypt magic

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  # registration password confirmation

  def password_confirmation(params)
    pw = params[:password]
    pwconfirm = params[:password_confirmation]

    (pw == pwconfirm) && (pw.size > 0)
  end

  # get all character ids for user

  def get_all_characters
    all_chars = []
    self.characters.each do |character|
      all_chars << character.id
    end

    all_chars
  end

end
