class RenameAccountNameColumnToAccounts < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :delivery_day_id, :delivery_id
  end
end
