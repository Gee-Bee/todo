class TasksController < ApplicationController
  before_action :find_task, only: [:destroy, :edit, :update]
  def new
    @task = Task.new
    render :show_form
  end
  def create
    @task = Task.new(task_params)
    save_task
  end
  def destroy
    @task.destroy
    @tasks = Task.all
  end
  def edit
    render :show_form
  end
  def update
    @task.assign_attributes(task_params)
    save_task
  end
  private
    def task_params
      params.require(:task).permit(:title, :note, :completed)
    end
    def find_task
      @task = Task.find(params[:id])
    end
    def save_task
      if @task.save
        @tasks = Task.all
        render :hide_form
      else
        render :show_form
      end
    end
end
