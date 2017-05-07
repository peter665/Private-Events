class AddInviteToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :invite_required, :boolean, :default => true
  end
end
