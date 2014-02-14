class TasksController < ApplicationController
  before_action :find_task, only: [:destroy, :edit, :update]
  def new
    @task = Task.new
    render :show_form
  end
  def create
    @task = Task.new(task_params)
    @task.user = current_user
    authorize! :create, @task
    save_task
  end
  def destroy
    authorize! :destroy, @task
    @task.destroy
    @tasks = Task.accessible_by(current_ability)
  end
  def edit
    authorize! :edit, @task
    render :show_form
  end
  def update
    @task.assign_attributes(task_params)
    authorize! :update, @task
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
        @tasks = Task.accessible_by(current_ability)
        render :hide_form
      else
        render :show_form
      end
    end
end
