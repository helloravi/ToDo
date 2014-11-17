class TasksController < ApplicationController
  def index
    @tasks_done = Task.done
    @tasks_pending = Task.pending
  end

  def update
    Task.find(params[:id]).mark_done!(params[:done].present?)
    redirect_to root_path
  end
end
