class TasksController < ApplicationController
  # before_action :set_task_list
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
      render json: @task, status: :created, location: nil #@task
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
    # @tasks = Task.where("description LIKE ?", "%#{params.expect(:description)}%")
    render json: @tasks
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params.expect(:id))
    end

    def search_task
      # count = 0
      # search_array = []
      # search_params = []
      # params.each do |k, v|
      #   count = count + 1
      #   if v.is_a?(String)
      #     search_array.push("#{k} like ?")
      #     search_params.push(v)
      #   else
      #     search_array.push("#{k} = ?")
      #     search_params.push(v)
      #   end
      # end
      # search_string = search_array.join("AND")
      # @tasks = Task.where(search_string, *search_params)


      @tasks = Task.where("description ILIKE ?", "%#{params.expect(:description)}%")
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.expect(task: [ :description, :complete, :task_list_id ])
    end

    # def set_task_list
    #   @task_list = TaskList.find(params.expect(:task_list_id))
    # end
end
