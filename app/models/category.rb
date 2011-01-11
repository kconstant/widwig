class Category < ActiveRecord::Base
  has_many :posts
    
  def children
    Category.where("parent_id = ?",id)
  end
  
  def full_name
    if parent_id
      Category.find(parent_id).name + ":" + name
    else
      name
    end
  end
end
