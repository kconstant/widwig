class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
      
    end
  end

  def self.down
    drop_table :categories
  end
end
