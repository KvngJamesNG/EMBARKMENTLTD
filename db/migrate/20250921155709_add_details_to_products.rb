class AddDetailsToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :quantity, :integer, default: 0
    add_column :products, :unit, :string, default: 0
    add_column :products, :packaging, :string, default: 0
    add_column :products, :quality, :string, default: 0
    add_column :products, :harvest_info, :string, default: 0
  end
end
