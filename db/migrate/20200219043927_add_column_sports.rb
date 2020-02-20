class AddColumnSports < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birth_date, :date
    add_column :users, :sports_event, :integer, default: 0
    add_column :users, :sports_stage, :integer, default: 0
    add_column :users, :sports_level, :integer, default: 0
    add_column :users, :self_introduction, :string, limit: 500
    add_column :users, :gender, :integer, null: false, default: 0
  end
end
