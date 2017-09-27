class MemoryVersesController < ApplicationController
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
    @user = current_user
  end

  # GET /memory_verses/1/edit
  def edit
    @user = current_user
  end

  # POST /memory_verses
  # POST /memory_verses.json

  def create
    @user = current_user
    @memory_verse = MemoryVerse.new(memory_verse_params)

    respond_to do |format|
      if @memory_verse.save
        format.html { redirect_to @memory_verse, notice: 'Memory verse was successfully created.' }
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
    respond_to do |format|
      if @memory_verse.update(memory_verse_params)
        format.html { redirect_to memory_verses_path, notice: 'Memory verse was successfully updated.' }
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
    @memory_verse.destroy
    respond_to do |format|
      format.html { redirect_to memory_verses_url, notice: 'Memory verse was successfully destroyed.' }
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
end
