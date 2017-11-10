class Image < ApplicationRecord
  has_attached_file :pic, styles: { medium: "300x300>", thumb: "100x100>", ruban_size: "150x150" }, default_url: "/images/:style/missing.png"
 validates_attachment_content_type :pic, content_type: /\Aimage\/.*\z/
 #belongs_to :user
 #belongs_to :product
 belongs_to :sania, polymorphic: true
end
