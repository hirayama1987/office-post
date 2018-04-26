class RenameStatusColumnToQuestions < ActiveRecord::Migration[5.1]
  def change
    rename_column :questions, :status, :status_id
  end
end
