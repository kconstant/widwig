class ReferencesController < ApplicationController
  
  def index
    @references = Reference.all
  end
  
  def new
    @reference = Reference.new
  end
  
  def create
    @reference = Reference.new(params[:reference])
    @reference.save
    redirect_to references_path
  end
  
  def edit
    @reference = Reference.find(params[:id])
  end
  
  def update
    @reference = Reference.find(params[:id])
    @reference.update_attributes(params[:reference])
    redirect_to references_path
  end
  
  def destroy
    @reference = Reference.find(params[:id])
    @reference.destroy
    redirect_to references_path
  end
  
end
