class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :cost
  belongs_to :day
  belongs_to :state
  belongs_to :status

  validate :image_presence

  def image_presence
    if image.attached?
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:image, 'にはjpegまたはpngファイルを添付してください')
      end
    else
      errors.add(:image, "can't be blank ")
    end
  end

FEE_REGEX = /\A[\d]+\z/.freeze




with_options presence: true do
  validates :name
  validates :description
  validates :price
end

validates :price, format: {with: FEE_REGEX, message: "Half-width number"}
validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000, message: "Out of setting range" }


with_options numericality: { other_than: 1, message: "Select" } do
  validates :category_id
  validates :status_id
  validates :cost_id
  validates :state_id
  validates :day_id
end
end
