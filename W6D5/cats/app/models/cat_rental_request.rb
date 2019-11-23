class CatRentalRequest < ApplicationRecord

  validades :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: ['APPROVED', 'DENIED', 'PENDING']}
  validate :does_not_overlap_approved_request

  add_index :cat_rental_requests, :cat_id

  belongs_to :cat,
    foreign_key: :cat_id,
    class_name: 'Cat'
  

  def overlapping_requests
    CatRentalRequest
      .where.not(id: self.id)
      .where(cat_id: cat_id)
      .where.not('start_date > :end_date OR end_date < :start_date', start_date: start_date, end_date: end_date)
  end

  def overlapping_approved_requests
    overlapping_requests.where('status = \'APPROVED\'')
  end

  def overlapping_pending_requests
    overlapping_requests.where('status = \'PENDING\'')
  end

  def does_not_overlap_approved_request

    return if self.denied?

    unless overlapping_approved_requests.empty?
      errors[:base] << 'Request conflicts with existing approved request'
    end
  end
end
