class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      current_user.attend(@event)
      flash[:success] = "Event created"
      redirect_to events_path
    else
      flash.now[:danger] = 'Try again'
      render :new
    end
  end

  private
    def event_params
      params.require(:event).permit(:description, :datum, :invite_required)
    end

end
