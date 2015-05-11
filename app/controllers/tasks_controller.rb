class TasksController < ApplicationController
  before_filter :find_list

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:notice] = "Task successfully saved"
      redirect_to list_path(id: @list.id)
    else
      flash[:error] = "Unable to save task"
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      respond_to do |format|
        format.html do
          flash[:notice] = "Task successfully updated"
          redirect_to list_path(id: @list.id)
        end
        format.json do
          render json: @task
        end
      end
    else
      flash[:error] = "Unable to update task"
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title,
                                 :description,
                                 :status,
                                 :due_date,
                                 :list_id,
                                 :tag_ids => [])
  end

  def find_list
    @list = List.find(params[:list_id])
  end
end
