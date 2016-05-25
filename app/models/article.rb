class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, :content, presence: true
  validates :name, uniqueness: true
end
