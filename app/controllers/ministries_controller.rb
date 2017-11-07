class MinistriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ministry, only: [:show, :edit, :update, :destroy]

  # GET /ministries
  # GET /ministries.json
  def index
    @ministries = Ministry.paginate(:page => params[:page], :per_page => 6)
    @user = current_user
  end

  # GET /ministries/1
  # GET /ministries/1.json
  def show
    @user = current_user
  end

  # GET /ministries/new
  def new
    @users = User.all
    @ministry = Ministry.new
    @ministry_editor = @ministry.ministry_editors.build
    authorize @ministry
    @user = current_user
  end

  # GET /ministries/1/edit
  def edit
    @user = current_user
    @users = User.all
    authorize @ministry
  end

  # POST /ministries
  # POST /ministries.json
  def create
    @ministry = Ministry.new(ministry_params)
    authorize @ministry
    @user = current_user
    @users = User.all

    respond_to do |format|
      if @ministry.save
        format.html { redirect_to current_user, notice: 'Ministry was successfully created.' }
        format.json { render :show, status: :created, location: @ministry }
      else
        format.html { render :new }
        format.json { render json: @ministry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ministries/1
  # PATCH/PUT /ministries/1.json
  def update
    @users = User.all
    authorize @ministry
    respond_to do |format|
      if @ministry.update(ministry_params)
        format.html { redirect_to user_path(current_user), notice: 'Ministry was successfully updated.' }
        format.json { render :show, status: :ok, location: @ministry }
      else
        format.html { render :edit }
        format.json { render json: @ministry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ministries/1
  # DELETE /ministries/1.json
  def destroy
    authorize @ministry
    @ministry.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Ministry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ministry
      @ministry = Ministry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ministry_params
      params.require(:ministry).permit(:name, :description, ministry_editors_attributes: [:id, :user_id, :ministry_id, :_destroy])
    end

    def user_not_authorized
      flash[:info] = "Sorry, only an administrator can perform that task."
      redirect_to current_user
    end

end
