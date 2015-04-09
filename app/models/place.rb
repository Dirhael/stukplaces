class Place < ActiveRecord::Base

  validates_presence_of :name, :address, :phone, :website, :user_id

  belongs_to :user
  has_many :reviews

  geocoded_by :address
  after_validation :geocode
end
