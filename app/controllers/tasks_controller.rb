class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.create(task_params)
    
    respond_to do |format|
      format.html {redirect_to user_tasks_path}
      format.js
    end

    # if @task.save
    #   flash[:success] = "Task Created!"
    #   redirect_to user_tasks_path
    # else
    #   render 'new'
    # end
  end

  def show
    @tasks = current_user.tasks
  end

  def edit
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(status: params[:task][:status])
    # params[:task][:status]
    redirect_to user_tasks_path
  end

  def destroy
  end

  private
  def task_params
    params.require(:task).permit(:title, :description, :complete_by)
  end
end
