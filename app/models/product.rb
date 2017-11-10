class Product < ApplicationRecord
  has_many :images, as: :sania
  include ActiveModel::Validations
  class RubValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      record.errors.add attribute, "thambi start the name with 'the'" unless value =~ /\Athe/i
    end
  end
  validates:name, presence:true, rub:true
  validates:brand, presence:true, exclusion: {in: %w(Ruban, ruban, RUBAN)}
  validates:product_type, presence:true
  validates:price, presence:true, numericality: true
  after_destroy:take_backup
  def take_backup
    File.open("#{Rails.root}/public/backup.json", "a+") do |a|
      a.write(self.to_json)
    end
  end
 before_validation:chuma
 def chuma
   if name.blank?
   self.name = "the Rescue"
 end
 end
 before_save:add_price
 def add_price
   self.price = price.to_i + 100
 end
end
