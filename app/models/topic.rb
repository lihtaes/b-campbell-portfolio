class Topic < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title

#a data relationship is created by giving one data element the aspect of having many of another data element, as in the code line below, where we are saying that any topic will have many blogs attached to it.  You can have dozens of blogs with the topic "Ruby Programming"
  has_many :blogs

  scope :with_blogs, -> {joins(:blogs).select("DISTINCT topics.*")}

  

end
