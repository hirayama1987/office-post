class CangeStatusDefaultToQuestions < ActiveRecord::Migration[5.1]
  def change
    change_column_default :questions, :status_id,1
  end
end
