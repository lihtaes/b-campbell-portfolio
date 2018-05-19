class Job < ApplicationRecord
  belongs_to :resume_item
  validates_presence_of :task
end
