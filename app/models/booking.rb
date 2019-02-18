class Booking < ApplicationRecord
  belongs_to :painting
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true

  # validate :end_after_start
  # validates :start_date, :end_date, :presence => true

  validates :total_paid, presence: true
  validates :user_id, presence: true, null: false
  validates :painting_id, presence: true, null: false

  # private

  # def end_after_start
  #   return if end_date.blank? || start_date.blank?
  #   if end_date < start_date
  #     errors.add(:end_date, "must be after the start date")
  #   end
  # end
end
