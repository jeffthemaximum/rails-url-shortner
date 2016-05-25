class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :url
      t.string :key

      t.timestamps null: false
    end
  end
end
