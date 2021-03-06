class ListsController < ApplicationController
  def index
    if params[:archived].present?
      @lists = List.where(archived: true)
    else
      @lists = List.where(archived: false)
    end
  end

  def show
    @list = List.find(params[:id])
    @task = Task.new

    if params[:completed].present?
      @tasks = @list.tasks.where(status: "complete")
    else
      @tasks = @list.tasks.where(status: "incomplete")
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      flash[:notice] = "List successfully created"
      redirect_to lists_path
    else
      flash[:error] = "Unable to create list"
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(list_params)
      respond_to do |format|
        format.html do
          flash[:notice] = "List successfully updated"
          redirect_to lists_path
        end
        format.json do
          render json: @list
        end
      end
    else
      flash[:error] = "Unable to update list"
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:title, :archived)
  end
end
