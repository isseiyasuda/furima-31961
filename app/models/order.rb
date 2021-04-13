class Order < ApplicationRecord
    include ActiveModel::Model
    attr_accessor :token,:history,:address
  
    # ここにバリデーションの処理を書く
    with_options presence: true do
    validates :postal_code,format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/,
      message: "" }
    validates :area_id
    validates :municipalities
    validates :street_num 
    validates :phone_num,numericality: {only_integer: true}, length: { in: 0..11 }
    end
  
    def save
      # 各テーブルにデータを保存する処理を書く
      @address = Address.new
      @address.save
      @history = History.new
      @history.save
    end
  end
  

