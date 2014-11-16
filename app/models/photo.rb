class Photo < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  validates :url,  presence: true

  def next
    photo = Photo.find_by_id(id + 1)
    if ! photo
      photo = Photo.first
    end
    photo
  end

  def prev
    photo = Photo.find_by_id(id - 1)
    if ! photo
      photo = Photo.last
    end
    photo
  end
end
