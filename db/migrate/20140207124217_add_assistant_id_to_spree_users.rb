class AddAssistantIdToSpreeUsers < ActiveRecord::Migration
  def change
    add_column :spree_users, :assistant_id, :integer
  end
end
