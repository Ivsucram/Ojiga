class FeedbackUsersController < ApplicationController
  before_action :set_feedback_user, only: [:show, :edit, :update, :destroy]

  # GET /feedback_users
  # GET /feedback_users.json
  def index
    @feedback_users = FeedbackUser.all
  end

  # GET /feedback_users/1
  # GET /feedback_users/1.json
  def show
  end

  # GET /feedback_users/new
  def new
    @feedback_user = FeedbackUser.new
  end

  # GET /feedback_users/1/edit
  def edit
  end

  # POST /feedback_users
  # POST /feedback_users.json
  def create
    @feedback_user = FeedbackUser.new(feedback_user_params)

    respond_to do |format|
      if @feedback_user.save
        format.html { redirect_to @feedback_user, notice: 'Feedback user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @feedback_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @feedback_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedback_users/1
  # PATCH/PUT /feedback_users/1.json
  def update
    respond_to do |format|
      if @feedback_user.update(feedback_user_params)
        format.html { redirect_to @feedback_user, notice: 'Feedback user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @feedback_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedback_users/1
  # DELETE /feedback_users/1.json
  def destroy
    @feedback_user.destroy
    respond_to do |format|
      format.html { redirect_to feedback_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback_user
      @feedback_user = FeedbackUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_user_params
      params.require(:feedback_user).permit(:grade, :description)
    end
end
