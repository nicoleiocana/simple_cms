class AdminUser < ApplicationRecord
  has_secure_password
  
  has_and_belongs_to_many :pages
  has_many :section_edits
  has_many :sections, through: :section_edits
  
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  
  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :username, uniqueness: true, length: { within: 8..25 }
  validates :email, presence: true, confirmation: true, length: { maximum: 100 }, format: { with: EMAIL_REGEX }
  
  scope :sorted, lambda { order("last_name ASC").order("first_name ASC") }
  
  def name
    first_name + ' ' + last_name
  end
  
end
