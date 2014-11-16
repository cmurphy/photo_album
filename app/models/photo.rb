class Photo < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  validates :url,  presence: true
end
