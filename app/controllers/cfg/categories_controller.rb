class Cfg::CategoriesController < ApplicationController

#GET /cfg/categories
#cfg_categories_path
  def index
    @categories = Category.where(:parent_id => nil)
  end
  
#GET /cfg/categories/new
#new_cfg_category_path
  def new
    @parents = Category.where(:parent_id => nil)
    @category = Category.new
  end

#POST /cfg/categories
#cfg_categories_path
  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to cfg_categories_path
    else
      render :action => "new"
    end
  end
  
#GET   /admin/posts/1  show  admin_post_path(id)

#GET /cfg/categories/1/edit
#edit_cfg_category_path(id)
  def edit
    @parents = Category.where(:parent_id => nil)
    @category = Category.find(params[:id])
  end

#PUT /cfg/categories/1
#cfg_category_path(id)
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to cfg_categories_path
    else
      render :action => "edit"
    end
  end

#DELETE /cfg/categories/1
#cfg_category_path(id)
  def destroy
    @category = Category.find(params[:id])
    if @category.children
      @category.children.each do |child|
        child.destroy
      end
    end
    @category.destroy
    redirect_to cfg_categories_path
  end
  
end
