class SectionEdit < ApplicationRecord
  belongs_to :admin_user, optional: true
  belongs_to :section, optional: true
end
