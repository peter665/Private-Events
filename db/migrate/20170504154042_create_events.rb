class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :description
      t.datetime :datum

      t.timestamps
    end
  end
end
