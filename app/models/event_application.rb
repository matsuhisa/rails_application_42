class EventApplication < ActiveRecord::Base
  MALE    = 1
  FEMALE  = 2

  validates :name, presence: true, length: { maximum: 30 }
  validates :name_ruby, presence: true, length: { maximum: 30 }
  validates :gender, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, length: { maximum: 256 }
  validates :phone, presence: true, length: { maximum: 30 }

end
