class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :stream, presence: true
  validates :description, presence: true

  scope :all_public , -> { where(private: false) }

end
