class ResumeItem < ApplicationRecord
  has_many :jobs, dependent: :destroy
  accepts_nested_attributes_for :jobs, 
                                allow_destroy: true,
                                reject_if: lambda { |attrs| attrs['task'].blank? }

  validates_presence_of :title, :time_there, :tech_used
  
end
