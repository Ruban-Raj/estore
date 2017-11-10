class User < ApplicationRecord
  before_validation :check_pass
  def check_pass
    if password != confirm_password
    errors.add( :base,"password and confirm password not matching")
  end
  end
  before_save :encription
  def encription
    self.password = Digest::MD5.hexdigest(password)
    self.confirm_password = Digest::MD5.hexdigest(confirm_password)
  end
  has_one :image, as: :sania
  accepts_nested_attributes_for :image
  end
