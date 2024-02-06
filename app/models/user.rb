class User < ApplicationRecord
  validates_presence_of :first_name,
                        :last_name,
                        :email

  has_many :user_parks
  has_many :parks, through: :user_parks
end