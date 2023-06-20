class ChangeColumnToAllowNull < ActiveRecord::Migration[6.0]
  def up
    change_column :posts, :name, :string, null: true 
  end

  def down
    change_column :posts, :name, :string, null: false
  end
end
