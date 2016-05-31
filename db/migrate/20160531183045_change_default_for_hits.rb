class ChangeDefaultForHits < ActiveRecord::Migration
  def change
    change_column :urls, :hits, :integer, :default => 0
  end
end
