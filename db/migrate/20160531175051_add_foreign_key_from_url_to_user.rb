class AddForeignKeyFromUrlToUser < ActiveRecord::Migration
  def change
    add_foreign_key :urls, :users
  end
end
