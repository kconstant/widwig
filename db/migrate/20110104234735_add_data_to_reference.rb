class AddDataToReference < ActiveRecord::Migration
  def self.up
    add_column :references, :data_file_name, :string
    add_column :references, :data_content_type, :string
    add_column :references, :data_full_size, :integer
  end

  def self.down
    remove_column :references, :data_file_name
    remove_column :references, :data_content_type
    remove_column :references, :data_full_size
  end
end
