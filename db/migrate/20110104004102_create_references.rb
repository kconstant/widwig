class CreateReferences < ActiveRecord::Migration
  def self.up
    create_table :references do |t|
      t.string :name
      t.string :author
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :references
  end
end
