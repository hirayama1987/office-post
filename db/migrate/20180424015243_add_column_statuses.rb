class AddColumnStatuses < ActiveRecord::Migration[5.1]
  def change
    add_column :statuses, :eng_name, :string
  end
end
