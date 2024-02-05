class Park < ApplicationRecord
  validates_presence_of :nps_id,
                        :name

  has_many :user_parks
  has_many :users, through: :user_parks
end