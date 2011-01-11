class TasksController < ApplicationController
#GET tasks
# tasks_path
  def index
    @tasks = Task.all
  end

#GET tasks/new
# new_task_path  
  def new
    @task = Task.new
  end

#POST tasks
# tasks_path  
  def create
    @task = Task.new(params[:task])
    if @task.save
      flash[:notice] = "Task is saved successfully"
      redirect_to tasks_path
    else
      flash[:notice] = "Task isn't saved"
      render new_task_path
    end
  end
#GET tasks/1
# edit_task_path(id)
  def edit
    @task = Task.find(params[:id])
  end
  
#PUT tasks
# task_path
  def update
    @task = Task.find(params[:id])
    @task.update_attributes(params[:task])
    redirect_to tasks_path
  end

  
#DELETE tasks
# tasks_path
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end
end
