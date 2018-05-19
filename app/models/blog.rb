class Blog < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: :slugged

  default_scope {order(created_at: :desc)}

  enum status: { draft: 0, published: 1 }
  
  validates_presence_of :title, :body, :topic_id, :description

  belongs_to :topic
  has_many :comments, dependent: :destroy
end
