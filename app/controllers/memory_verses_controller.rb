class MemoryVersesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_memory_verse, only: [:show, :edit, :update, :destroy]

  # GET /memory_verses
  # GET /memory_verses.json
  def index
    @memory_verses = MemoryVerse.all
    @user = current_user
  end

  # GET /memory_verses/1
  # GET /memory_verses/1.json
  def show
    @user = current_user
  end

  # GET /memory_verses/new
  def new
    @memory_verse = MemoryVerse.new
    authorize @memory_verse
    @user = current_user
  end

  # GET /memory_verses/1/edit
  def edit
    @user = current_user
    authorize @memory_verse
  end

  # POST /memory_verses
  # POST /memory_verses.json

  def create
    @user = current_user
    @memory_verse = MemoryVerse.new(memory_verse_params)
    authorize @memory_verse

    respond_to do |format|
      if @memory_verse.save
        format.html { redirect_to user_path(current_user), notice: 'Memory verse was successfully created.' }
        format.json { render :show, status: :created, location: @memory_verse }
      else
        format.html { render :new }
        format.json { render json: @memory_verse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memory_verses/1
  # PATCH/PUT /memory_verses/1.json
  def update
    authorize @memory_verse
    respond_to do |format|
      if @memory_verse.update(memory_verse_params)
        format.html { redirect_to user_path(current_user), notice: 'Memory verse was successfully updated.' }
        format.json { render :show, status: :ok, location: @memory_verse }
      else
        format.html { render :edit }
        format.json { render json: @memory_verse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memory_verses/1
  # DELETE /memory_verses/1.json
  def destroy
    authorize @memory_verse
    @memory_verse.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Memory verse was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_memory_verse
      @memory_verse = MemoryVerse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def memory_verse_params
      params.require(:memory_verse).permit(:verse, :reference, :verse_date)
    end

    def user_not_authorized
      flash[:info] = "Sorry, only an administrator can perform that task."
      redirect_to user_path(current_user)
    end
end
