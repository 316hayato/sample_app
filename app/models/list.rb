class List < ApplicationRecord
  has_one_attached :image #画像を扱うためのimageカラムが追記されたかのように扱う
end 
