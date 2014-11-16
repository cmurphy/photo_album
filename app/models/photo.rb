class Photo < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  validates :url,  presence: true

  def next
    photo = Photo.where("id > ?", id).first
    if ! photo
      photo = Photo.first
    end
    photo
  end

  def prev
    photo = Photo.where("id < ?", id).last
    if ! photo
      photo = Photo.last
    end
    photo
  end
end
