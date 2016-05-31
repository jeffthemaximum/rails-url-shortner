class AddHitsToUrls < ActiveRecord::Migration
  def change
    add_column :urls, :hits, :integer
  end
end
