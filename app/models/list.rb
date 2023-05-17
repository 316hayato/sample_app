class List < ApplicationRecord
  has_one_attached :image #画像を扱うためのimageカラムが追記されたかのように扱う
  
  # バリデーション(入力チェックの機能)を追加
  # validates:対象項目, presence:存在確認
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
end 
