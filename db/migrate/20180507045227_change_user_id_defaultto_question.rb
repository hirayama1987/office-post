class ChangeUserIdDefaulttoQuestion < ActiveRecord::Migration[5.1]
  def change
    change_column_default :questions, :user_id, 0
  end
end
