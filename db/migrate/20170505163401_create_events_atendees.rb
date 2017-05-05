class CreateEventsAtendees < ActiveRecord::Migration[5.0]
  def change
    create_table :events_atendees do |t|

      t.timestamps
    end
  end
end
