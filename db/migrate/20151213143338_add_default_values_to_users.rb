class AddDefaultValuesToUsers < ActiveRecord::Migration
  def change
    change_column_default :users, :status, User.statuses[:novice]
  end
end
