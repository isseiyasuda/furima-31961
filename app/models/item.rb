class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :area
  belongs_to :charge
  belongs_to :condition
  belongs_to :delivery
  belongs_to :user
  has_one :history  
  has_one_attached :image
  
    with_options presence: true do
    validates :product_name
    validates :description
    validates :price, numericality: {only_integer: true, in: 300..9999999 }
    end

    with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :area_id
    validates :delivery_id
    end

validates :image, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

end
