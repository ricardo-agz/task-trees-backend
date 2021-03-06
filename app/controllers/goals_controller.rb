class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :update, :destroy]

  # GET /goals
  def index
    @goals = Goal.all

    render json: @goals
  end

  def get_goal
    @name = params[:goal_name].downcase
    @goal = Goal.find_by('lower(name) = ?', @name.downcase.gsub("-", " "))

    render json: @goal
  end

  # GET /goals/1
  def show
    render json: @goal
  end

  # POST /goals
  def create
    @goal = Goal.new(goal_params)

    if @goal.save
      render json: @goal, status: :created, location: @goal
    else
      render json: @goal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /goals/1
  def update
    if @goal.update(goal_params)
      render json: @goal
    else
      render json: @goal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /goals/1
  def destroy
    @goal.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def goal_params
      params.require(:goal).permit(:name)
    end
end
