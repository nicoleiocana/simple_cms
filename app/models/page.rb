class Page < ApplicationRecord
  acts_as_list scope: :subject
  
  belongs_to :subject, optional: true
  has_many :sections
  has_and_belongs_to_many :admin_users
  validates :name, presence: true, length: { maximum: 255 }
  validates :permalink, uniqueness: true, presence: true, length: { within: 3..255 }
  
  scope :visible, lambda { where(visible: true) }
  scope :invisible, lambda { where(visible: false) }
  scope :sorted, lambda { order("position ASC") }
  scope :newest_first, lambda { order("created_at DESC") }
  scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"]) }
end
