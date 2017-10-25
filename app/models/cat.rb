class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  validates :color ,  presence: true, inclusion: { in: %w(black white gray)}
  validates :sex ,  presence: true, inclusion: { in: %w(M W m w ) }

  has_many :cat_rental_requests,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: :CatRentalRequest

 def age
   time_ago_in_words(birth_date)
 end
end
