class Patient < ApplicationRecord
  has_many :appointments
  has_many :physicians, through: :appointments
  has_many :diagnosis_items

  validates_each :first_name, :last_name do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  end

  validates :first_name, presence: true, length: { minimum: 2, too_short: "%{count} characters is the minumum allowed" }
  validates :last_name, presence: true, length: { minimum: 2, too_short: "%{count} characters is the minumum allowed" }
  validates :age, presence: true, numericality: { only_integer: true, in: 1..130 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "enter valid email" }

  def full_name
    "#{first_name} #{last_name}"
  end
end
