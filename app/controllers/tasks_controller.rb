class TasksController < ApplicationController
  def index
    @tasks_done = Task.done
    @tasks_pending = Task.pending
  end

  def update
    task = Task.find(params[:id])
    task.mark_done!
    redirect_to root_path
  end
end
