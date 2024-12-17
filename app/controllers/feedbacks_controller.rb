class FeedbacksController < ApplicationController
  before_action :require_login
  before_action :set_feedback, only: %i[ show edit update destroy ]

  # GET /feedbacks?presentation_id= or /feedbacks.json
  def index
    @presentations = Presentation.find(params[:presentation_id]) # Fetch the presentation
    @feedbacks = Feedback.all.select do |feedback|
      feedback.presentation_id == params[:presentation_id].to_i
    end
  end

  # GET /feedbacks/1 or /feedbacks/1.json
  def show
    @presentations = Presentation.find(@feedback.presentation_id)
  end

  # GET /feedbacks/new?presentation_id=
  def new
    @presentations = Presentation.find(params[:presentation_id])
    @feedback = Feedback.new
  end

  # GET /feedbacks/1/edit
  def edit
    @presentations = Presentation.find(@feedback.presentation_id)
  end

  # POST /feedbacks or /feedbacks.json
  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to "/feedbacks?presentation_id=#{@feedback.presentation_id}", notice: "Feedback was successfully created." }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedbacks/1 or /feedbacks/1.json
  def update
    @presentations = Presentation.find(@feedback.presentation_id)
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to "/feedbacks?presentation_id=#{@feedback.presentation_id}", notice: "Feedback was successfully updated." }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1 or /feedbacks/1.json
  def destroy
    @presentations = Presentation.find(@feedback.presentation_id)
    @feedback.destroy!

    respond_to do |format|
      format.html { redirect_to "/feedbacks?presentation_id=#{@presentations.id}", status: :see_other, notice: "Feedback was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def feedback_params
      params.require(:feedback).permit(:presentation_id, :commentor_id, :comments, :grades)
    end
end
