class GradeCalcsController < ApplicationController
  before_action :set_grade_calc, only: [:show, :edit, :update, :destroy]

  # GET /grade_calcs
  # GET /grade_calcs.json
  def index
    @grade_calcs = GradeCalc.all
  end

  # GET /grade_calcs/1
  # GET /grade_calcs/1.json
  def show
  end

  # GET /grade_calcs/new
  def new
    @grade_calc = GradeCalc.new
  end

  # GET /grade_calcs/1/edit
  def edit
  end

  # POST /grade_calcs
  # POST /grade_calcs.json
  def create
    @grade_calc = GradeCalc.new(grade_calc_params)

    respond_to do |format|
      if @grade_calc.save
        format.html { redirect_to @grade_calc, notice: 'Grade calc was successfully created.' }
        format.json { render action: 'show', status: :created, location: @grade_calc }
      else
        format.html { render action: 'new' }
        format.json { render json: @grade_calc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grade_calcs/1
  # PATCH/PUT /grade_calcs/1.json
  def update
    respond_to do |format|
      if @grade_calc.update(grade_calc_params)
        format.html { redirect_to @grade_calc, notice: 'Grade calc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @grade_calc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grade_calcs/1
  # DELETE /grade_calcs/1.json
  def destroy
    @grade_calc.destroy
    respond_to do |format|
      format.html { redirect_to grade_calcs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade_calc
      @grade_calc = GradeCalc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_calc_params
      params.require(:grade_calc).permit(:gradecalc)
    end
end
