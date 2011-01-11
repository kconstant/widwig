class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :name
      t.date :start_at
      t.date :end_at
    end
  end

  def self.down
    drop_table :tasks
  end
end
