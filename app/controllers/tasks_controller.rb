class TasksController < ApplicationController
  before_action :find_task, only: [:destroy, :edit, :update]
  def new
    @task = Task.new
    render :show_form
  end
  def create
    @task = Task.create(task_params)
    @tasks = Task.all
    render :hide_form
  end
  def destroy
    @task.destroy
    @tasks = Task.all
  end
  def edit
    render :show_form
  end
  def update
    @task.update_attributes(task_params)
    @tasks = Task.all
    render :hide_form
  end
  private
    def task_params
      params.require(:task).permit(:title, :note, :completed)
    end
    def find_task
      @task = Task.find(params[:id])
    end
end
