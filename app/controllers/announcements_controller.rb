class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show, :edit, :update, :destroy]

  # GET /announcements
  # GET /announcements.json
  def index
    @announcements = Announcement.all
    @user = current_user
  end

  # GET /announcements/1
  # GET /announcements/1.json
  def show
    @user = current_user
  end

  # GET /announcements/new
  def new
    @announcement = Announcement.new
    @user = current_user
    @ministries = Ministry.all
  end

  # GET /announcements/1/edit
  def edit
    @user = current_user
    @ministries = Ministry.all
    authorize @announcement
  end

  # POST /announcements
  # POST /announcements.json
  def create
    @announcement = current_user.announcements.new(announcement_params)
    @user = current_user
    @ministries = Ministry.all
    authorize @announcement

    respond_to do |format|
      if @announcement.save
        format.html { redirect_to @announcement, notice: 'Announcement was successfully created.' }
        format.json { render :show, status: :created, location: @announcement }
      else
        format.html { render :new }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /announcements/1
  # PATCH/PUT /announcements/1.json
  def update
    authorize @announcement
    @user = current_user
    @ministries = Ministry.all
    respond_to do |format|
      if @announcement.update(announcement_params)
        format.html { redirect_to @announcement, notice: 'Announcement was successfully updated.' }
        format.json { render :show, status: :ok, location: @announcement }
      else
        format.html { render :edit }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /announcements/1
  # DELETE /announcements/1.json
  def destroy
    authorize @announcement
    @announcement.destroy
    respond_to do |format|
      format.html { redirect_to announcements_url, notice: 'Announcement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def announcement_params
      params.require(:announcement).permit(:subject, :text, :ministry_id, :user_id)
    end

    def user_not_authorized
      flash[:info] = "Sorry, only an administrator or authorized editor can do that."
      redirect_to ministries_path
    end
end
