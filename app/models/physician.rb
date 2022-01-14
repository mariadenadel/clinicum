class Physician < ApplicationRecord
  LEVELS = ["junior", "middle", "senior"].freeze

  has_many :appointments
  has_many :patients, through: :appointments
  has_many :diagnosis_items

  validates_each :first_name, :last_name do |record, attr, value|
    record.errors.add(attr, "must start with upper case") if value =~ /\A[[:lower:]]/
  end

  validates :first_name, presence: true, length: { minimum: 2, too_short: "%{count} characters is the minumum allowed" }
  validates :last_name, presence: true, length: { minimum: 2, too_short: "%{count} characters is the minumum allowed" }
  validates :phone_number, presence: true, format: { with: /\A\+380\d{9}\z/, message: "enter valid UA phone number" }
  validates :level, presence: true, inclusion: { in: LEVELS }

  def full_name
    "#{first_name} #{last_name}"
  end
end
