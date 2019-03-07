class Section < ApplicationRecord
  acts_as_list scope: :subject
  
  belongs_to :page, optional: true
  has_many :section_edits
  has_many :admin_users, through: :section_edits
  
  CONTENT_TYPES = ['text', 'HTML']
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :content, presence: true
  validates :content_type, inclusion: { in: CONTENT_TYPES, message: "must be one of: #{CONTENT_TYPES.join (', ')}" }
  
  scope :visible, lambda { where(visible: true) }
  scope :invisible, lambda { where(visible: false) }
  scope :sorted, lambda { order("position ASC") }
  scope :newest_first, lambda { order("created_at DESC") }
  scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"]) }
  
end
