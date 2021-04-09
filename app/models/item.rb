class Item < ApplicationRecord
  belongs_to :user
  has_one :history
  has_one_attached :image


  with_options presence: true do
  validates :product_name
  validates :category_id
  validates :condition_id
  validates :charge_id
  validates :area_id
  validates :delivery_day_id
  validates :description
  validates :price　numericality: { only_integer: true, in: 300..9999999 }
end

validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

end
