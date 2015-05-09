class ListsController < ApplicationController
  def index
    @unarchived_lists = List.where(archived: false)
    @archived_lists = List.where(archived: true)
  end

  def show
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
  end

  private

  def list_params
    params.require(:list).permit(:title, :archived)
  end
end
