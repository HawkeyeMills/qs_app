class DailyGradesController < ApplicationController
  before_action :set_daily_grade, only: [:show, :edit, :update, :destroy]

  # GET /daily_grades
  # GET /daily_grades.json
  def index
    @daily_grades = DailyGrade.all
  end

  # GET /daily_grades/1
  # GET /daily_grades/1.json
  def show
  end

  # GET /daily_grades/new
  def new
    @daily_grade = DailyGrade.new
  end

  # GET /daily_grades/1/edit
  def edit
  end

  # POST /daily_grades
  # POST /daily_grades.json
  def create
    @daily_grade = DailyGrade.new(daily_grade_params)

    respond_to do |format|
      if @daily_grade.save
        format.html { redirect_to @daily_grade, notice: 'Daily grade was successfully created.' }
        format.json { render action: 'show', status: :created, location: @daily_grade }
      else
        format.html { render action: 'new' }
        format.json { render json: @daily_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_grades/1
  # PATCH/PUT /daily_grades/1.json
  def update
    respond_to do |format|
      if @daily_grade.update(daily_grade_params)
        format.html { redirect_to @daily_grade, notice: 'Daily grade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @daily_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_grades/1
  # DELETE /daily_grades/1.json
  def destroy
    @daily_grade.destroy
    respond_to do |format|
      format.html { redirect_to daily_grades_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_grade
      @daily_grade = DailyGrade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_grade_params
      params.require(:daily_grade).permit(:grade_id, :points, :possible, :gradeDate)
    end
end
