class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, :description, :link, presence: true
  validates :name, uniqueness: true
end
