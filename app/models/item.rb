class Item < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :reservations
  has_many :reviews
 
  def full_street_address
    [address_street, address_city, address_state, address_zip].compact.join(', ')
  end
    
  geocoded_by :full_street_address
  after_validation :geocode
    
  validates :category, presence: true
  validates :subcategory, presence: true
  validates :listing_name, presence: true, length: {maximum: 64}
  validates :summary, presence: true, length: {maximum: 1000}
  validates :address_city, presence: true
  validates :address_state, presence: true, length: {maximum: 2}
  validates :address_zip, presence: true
  validates :price, presence: true, numericality: true
  validates :deposit, presence: true, numericality: true
    
  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:star).round(2) 
  end
end
