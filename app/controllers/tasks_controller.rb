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
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

private
  def task_params
    params.require(:task).permit(:description)
  end
end
