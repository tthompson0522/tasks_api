class TaskListsController < ApplicationController
  before_action :set_task_list, only: %i[ show update destroy ]
  before_action :search_task_list, only: %i[ search ]
  # GET /task_lists
  def index
    @task_lists = TaskList.order(created_at: :desc)

    render json: @task_lists
  end

  # GET /task_lists/1
  def show
    render json: @task_list
  end

  # POST /task_lists
  def create
    @task_list = TaskList.new(task_list_params)

    if @task_list.save
      render json: @task_list, status: :created, location: nil #@task_list
    else
      render json: @task_list.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /task_lists/1
  def update
    if @task_list.update(task_list_params)
      render json: @task_list
    else
      render json: @task_list.errors, status: :unprocessable_content
    end
  end

  # DELETE /task_lists/1
  def destroy
    @task_list.destroy!
  end

  def search
    render json: @task_lists
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_list
      @task_list = TaskList.find(params.expect(:id))
    end

    def search_task_list
      @task_lists = Task.where("name ILIKE ?", "%#{params.expect(:name)}%")
    end

    # Only allow a list of trusted parameters through.
    def task_list_params
      params.expect(task_list: [ :name ])
    end
end
