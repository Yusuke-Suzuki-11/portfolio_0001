class AddColumnArea < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :area, :integer, default: 0
  end
end
