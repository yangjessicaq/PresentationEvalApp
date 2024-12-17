class GradesController < ApplicationController
    before_action :require_login
    before_action :set_grade, only: %i[show edit update destroy]
  
    # GET /grades or /grades.json
    def index
      @presentations = Presentation.all # Fetch all presentations
      @grades = Grade.all # Fetch all grades
    end
  
    # GET /grades/1 or /grades/1.json
    def show
      @presentation = @grade.presentation
    end
  
    # GET /grades/new
    def new
      @presentations = Presentation.all # Fetch all presentations
      @grade = Grade.new
    end
  
    # GET /grades/1/edit
    def edit
      @grade = Grade.find(params[:id])
    end
  
   # POST /grades or /grades.json
    def create    
      @grade = Grade.new(grade_params)
      @grade.grader_id = current_user.id # Set grader_id to the current user's ID
      @grade.grader_name = current_user.full_name
  
      respond_to do |format|
        if @grade.save
          format.html { redirect_to grades_path, notice: "Grade was successfully created." }
          format.json { render :show, status: :created, location: @grade }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @grade.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /grades/1 or /grades/1.json
    def update
      respond_to do |format|
        if @grade.update(grade_params)
          format.html { redirect_to @grade, notice: "Grade was successfully updated." }
          format.json { render :show, status: :ok, location: @grade }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @grade.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /grades/1 or /grades/1.json
    def destroy
      @grade = Grade.find(params[:id])  # Make sure to fetch the grade to destroy
      @grade.destroy!
    
      respond_to do |format|
        # After deletion, redirect to the list of all grades
        format.html { redirect_to grades_path, status: :see_other, notice: "Grade was successfully destroyed." }
        format.json { head :no_content }
      end
    end
      
    private
  
    # check if user is logged in
    def user_logged_in?
      current_user.present?
    end
  
    # access the current logged-in user
    def current_user
        User.find(session[:user_id]) if session[:user_id]
    end      
  
    private
        # set grade for show, edit, update, and destroy
        def set_grade
        @grade = Grade.find(params[:id])
        end
    
        # only allow these parameters
        def grade_params
          params.require(:grade).permit(:presentation_id, :grade_value, :comments)
        end
  end
  