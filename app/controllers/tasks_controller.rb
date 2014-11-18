class TasksController < ApplicationController

  
  def index
    @tasks = current_user.tasks
    @new_task = Task.new
  end

  def create
  	@task = current_user.tasks.new
  	@task.title = params[:task][:title]
  	@save_success = @task.save
  end

  def update
  	@task = current_user.tasks.find(params[:id])
    @task.mark_done!(params[:done].present?)
    
  end

  def destroy
  	@task = current_user.tasks.find(params[:id])
  	@task.destroy
  end

end
