class ChangeFieldToEvents < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :creator_id, :integer
  end
end
