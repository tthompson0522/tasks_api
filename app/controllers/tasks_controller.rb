class TasksController < ApplicationController
  before_action :set_task, only: %i[ show update destroy ]
  before_action :search_task, only: %i[ search ]

  # GET /tasks
  def index
    @tasks = Task.all

    render json: @tasks
  end

  # GET /tasks/1
  def show
    render json: @task
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created, location: nil
    else
      render json: @task.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_content
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy!
  end

  def search
    render json: @tasks
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params.expect(:id))
    end

    def search_task
      @tasks = Task.where("description ILIKE ?", "%#{params.expect(:description)}%")
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.expect(task: [ :description, :complete, :task_list_id ])
    end

end
