class Character < ActiveRecord::Base
  has_many :items
  belongs_to :user

  validates :name, length: { minimum: 2 }
end
