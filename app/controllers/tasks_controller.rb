class TasksController < ApplicationController
  def show
  end

  def new
    @list = List.find(params[:list_id])
    @task = Task.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = Task.new(task_params)

    if @task.save
      flash[:notice] = "Task successfully saved"
      redirect_to list_path(list_id: @list.id)
    else
      flash[:error] = "Unable to save task"
      render :new
    end
  end

  def edit
  end

  private

  def task_params
    params.require(:task).permit(:title,
                                 :description,
                                 :status,
                                 :due_date,
                                 :list_id)
  end
end
