class AddCreatorIdToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :users, column: :creator_id
  end
end
