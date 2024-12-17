class PresentationsController < ApplicationController
  before_action :require_login
  before_action :set_presentation, only: %i[ show edit update destroy ]

  # GET /presentations or /presentations.json
  def index
    @presentations = Presentation.all
  end

  # GET /presentations/1 or /presentations/1.json
  def show
  end

  # GET /presentations/new
  def new
    @presentation = Presentation.new
  end

  # GET /presentations/1/edit
  def edit
  end

  # POST /presentations or /presentations.json
  def create
    @presentation = Presentation.new(presentation_params)

    # Validate each email to check if the user exists
    user_emails = [:email1, :email2, :email3, :email4, :email5]
    user_emails.each do |user_email|
      email = @presentation.send(user_email)
      if email.present? && !User.exists?(email: email)
        @presentation.errors.add(user_email, ": No user with email #{email} exists.")
      end
    end
    # Check if there are any validation errors before attempting to save
    if @presentation.errors.any?
      # Validation failed so rerender the form with errors
      render :new, status: :unprocessable_entity
    else
      # Validation passed so proceed to save the presentation
      respond_to do |format|
        if @presentation.save
          format.html { redirect_to @presentation, notice: "Presentation was successfully created." }
          format.json { render :show, status: :created, location: @presentation }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @presentation.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /presentations/1 or /presentations/1.json
  def update
    respond_to do |format|
      if @presentation.update(presentation_params)
        format.html { redirect_to @presentation, notice: "Presentation was successfully updated." }
        format.json { render :show, status: :ok, location: @presentation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presentations/1 or /presentations/1.json
  def destroy
    @presentation = Presentation.find(params[:id])
  
    # Delete all grades associated with this presentation
    Grade.where(presentation_id: @presentation.id).destroy_all
  
    # Then destroy the presentation itself
    @presentation.destroy
  
    respond_to do |format|
      format.html { redirect_to presentations_path, status: :see_other, notice: "Presentation and associated grades were successfully destroyed." }
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presentation
      @presentation = Presentation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def presentation_params
      params.require(:presentation).permit(:email1, :email2, :email3, :email4, :email5, :topic, :present_date, :present_start_time, :present_end_time, :location)
    end
end
