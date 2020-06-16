class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :destroy]
  before_action :new_task_with_params, only: [:create, :update]
  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task.save

    redirect_to tasks_path
  end

  def edit; end

  def update
    @task.save

    redirect_to tasks_path
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def new_task_with_params
    @task = Task.new(task_params)
  end

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
