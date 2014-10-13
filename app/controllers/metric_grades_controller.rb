class MetricGradesController < ApplicationController
  before_action :set_metric_grade, only: [:show, :edit, :update, :destroy]

  # GET /metric_grades
  # GET /metric_grades.json
  def index
    @metric_grades = MetricGrade.all
  end

  # GET /metric_grades/1
  # GET /metric_grades/1.json
  def show
  end

  # GET /metric_grades/new
  def new
    @metric_grade = MetricGrade.new
  end

  # GET /metric_grades/1/edit
  def edit
  end

  # POST /metric_grades
  # POST /metric_grades.json
  def create
    @metric_grade = MetricGrade.new(metric_grade_params)

    respond_to do |format|
      if @metric_grade.save
        format.html { redirect_to @metric_grade, notice: 'Metric grade was successfully created.' }
        format.json { render action: 'show', status: :created, location: @metric_grade }
      else
        format.html { render action: 'new' }
        format.json { render json: @metric_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /metric_grades/1
  # PATCH/PUT /metric_grades/1.json
  def update
    respond_to do |format|
      if @metric_grade.update(metric_grade_params)
        format.html { redirect_to @metric_grade, notice: 'Metric grade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @metric_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /metric_grades/1
  # DELETE /metric_grades/1.json
  def destroy
    @metric_grade.destroy
    respond_to do |format|
      format.html { redirect_to metric_grades_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metric_grade
      @metric_grade = MetricGrade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def metric_grade_params
      params.require(:metric_grade).permit(:metric_id, :grade_id, :points, :percentage)
    end
end
