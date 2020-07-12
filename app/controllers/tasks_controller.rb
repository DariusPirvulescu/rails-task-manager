class TasksController < ApplicationController
  before_action :find_task, only: [ :show, :edit, :update, :destroy ]
  before_action :new_task_with_params, only: [:create]
  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task.save

    redirect_to root_path
  end

  def edit; end

  def update
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy

    redirect_to root_path
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def new_task_with_params
    @task = Task.new(task_params)
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
