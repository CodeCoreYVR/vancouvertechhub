class RemoveUserIdFromOrganizations < ActiveRecord::Migration
  def change
    remove_column :organizations, :user_id, :string
  end
end
