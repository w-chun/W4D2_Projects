class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, presence: true, inclusion: {in: %w(APPROVED DENIED PENDING)}

  belongs_to :cat,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: :Cat,
  dependent: :destroy

  def over_lapping_requests
    overlapping=[]
    cat.cat_rental_requests.delete(self).each do |request|
      overlapping.push(request) if (overlap?(request.start_date, request.end_date))
    end
    overlapping
  end

  def overlap?(start_d, end_d)

      if (end_d > self.start_date && end_d < self.end_date)
        return true
      elsif  (start_d<self.end_date &&  self.start_date< start_d )
         return true
      else
        false
      end
  end

  def overlapping_approved_requests
    over_lapping_requests.select{|request| request.status=='APPROVED'}
  end

  def does_not_overlap_approved_request
    overlapping_approved_requests.empty?
  end

end
