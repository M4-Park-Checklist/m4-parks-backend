class UserPark < ApplicationRecord
  validates :visited, inclusion: [true, false]

  belongs_to :user
  belongs_to :park
end