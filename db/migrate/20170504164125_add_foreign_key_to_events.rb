class AddForeignKeyToEvents < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :events, :creator_id
  end
end
