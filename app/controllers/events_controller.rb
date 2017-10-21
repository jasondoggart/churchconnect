class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @user = current_user
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @user = current_user
  end

  # GET /events/new
  def new
    @event = Event.new
    @user = current_user
    @ministries = Ministry.all
  end

  # GET /events/1/edit
  def edit
    @user = current_user
    @ministries = Ministry.all
    authorize @event
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    debugger
    @ministries = Ministry.all
    @user = current_user
    authorize @event

    respond_to do |format|
      if @event.save
        format.html { redirect_to users_show_path(current_user), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    authorize @event
    @user = current_user
    @ministry = Ministry.all
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to users_show_path(current_user), notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    authorize @event
    @event.destroy
    respond_to do |format|
      format.html { redirect_to users_show_path(current_user), notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :description, :start_time, :end_time, :ministry_id)
    end

    def user_not_authorized
      flash[:info] = "Sorry, only an administrator or authorized editor can do that"
      redirect_to users_show_path(current_user)
    end
end
