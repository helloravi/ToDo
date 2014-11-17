class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @new_task = Task.new
  end

  def create
  	@task = Task.new
  	@task.title = params[:task][:title]
  	@save_success = @task.save
  end

  def update
  	@task = Task.find(params[:id])
    @task.mark_done!(params[:done].present?)
    
  end

  def destroy
  	@task = Task.find(params[:id])
  	@task.destroy
  end

end
