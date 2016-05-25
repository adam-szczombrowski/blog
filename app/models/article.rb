class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, :content, presence: true
  validates :name, uniqueness: true

  def should_generate_new_friendly_id?
    name_changed?
  end
end
