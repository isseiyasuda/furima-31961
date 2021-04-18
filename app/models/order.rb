class Order 
    include ActiveModel::Model
    attr_accessor :token,:price,:postal_code,:area_id,:municipalities,:street_num,:phone_num,:building,:user_id,:item_id
  
    # ここにバリデーションの処理を書く
    with_options presence: true do
    validates :postal_code,format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/,
      message: "" }
    validates :area_id
    validates :municipalities
    validates :street_num 
    validates :phone_num,numericality: {only_integer: true}, length: { in: 0..11 }
    validates :token
    end
  
    def save
      # 各テーブルにデータを保存する処理を書く

      @history = History.create(user_id: user_id,item_id: item_id)
      Address.create(postal_code: postal_code,area_id: area_id,municipalities: municipalities,street_num: street_num,phone_num: phone_num,building: building,history_id: @history.id)

    end
  end
  

