class GradeConfigsController < ApplicationController
  before_action :set_grade_config, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:index, :edit, :update, :destroy]
  before_action :admin_user,     only: :destroy

  # GET /grade_configs
  # GET /grade_configs.json
  def index
    @grade_configs = GradeConfig.all
  end

  # GET /grade_configs/1
  # GET /grade_configs/1.json
  def show
  end

  # GET /grade_configs/new
  def new
    @grade_config = GradeConfig.new
  end

  # GET /grade_configs/1/edit
  def edit
  end

  # POST /grade_configs
  # POST /grade_configs.json
  def create
    @grade_config = GradeConfig.new(grade_config_params)

    respond_to do |format|
      if @grade_config.save
        format.html { redirect_to @grade_config, notice: 'Grade config was successfully created.' }
        format.json { render action: 'show', status: :created, location: @grade_config }
      else
        format.html { render action: 'new' }
        format.json { render json: @grade_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grade_configs/1
  # PATCH/PUT /grade_configs/1.json
  def update
    respond_to do |format|
      if @grade_config.update(grade_config_params)
        format.html { redirect_to @grade_config, notice: 'Grade config was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @grade_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grade_configs/1
  # DELETE /grade_configs/1.json
  def destroy
    @grade_config.destroy
    respond_to do |format|
      format.html { redirect_to grade_configs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade_config
      @grade_config = GradeConfig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_config_params
      params.require(:grade_config).permit(:metricconfig_id, :weight, :percentoftotal, :goal, :calcToUse, :type, :note)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
