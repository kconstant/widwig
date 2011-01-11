class AddExposureToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :exposure, :boolean, :default => false
  end

  def self.down
    remove_column :categories, :exposure, :boolean
  end
end
