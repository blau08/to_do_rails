class TasksController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      redirect_to list_path(@task.list)
    else
      render :new
    end
  end
  def show
    @list = List.find(params[:id])
    @task = Task.find(params[:id])
  end
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end
  def edit
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    render :edit
  end
  def update
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to list_path(@task.list)
    else
      render :edit
    end
  end
  def destroy
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to list_path(@task.list)
  end
  def completed
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    @task.update_attribute(:completed, true)
    redirect_to list_path(@task.list)
  end
private
  def task_params
    params.require(:task).permit(:description, :completed)
  end
end
