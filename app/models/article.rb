class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  def self.search(search)
    where("title LIKE ? OR content LIKE ? OR language LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
  end
end
