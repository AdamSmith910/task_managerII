class ListController < ApplicationController
  def index
    @unarchived_lists = List.where(archived: false)
    @archived_lists = List.where(archived: true)
  end

  def show
  end

  def new
  end

  def edit
  end
end
