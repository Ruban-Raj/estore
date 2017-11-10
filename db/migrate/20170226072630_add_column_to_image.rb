class AddColumnToImage < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :sania_id, :integer
    add_column :images, :sania_type, :string
  end
end
