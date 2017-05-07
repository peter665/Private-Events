class EventsAtendeesController < ApplicationController
  def create
    @new = current_user.events_atendees.build(events_atendees_params)
    if @new.save
      flash[:success] = 'You have signed up for this event'
      redirect_to event_path(Event.find_by(id:events_atendees_params[:attended_event_id]))
    else
      flash[:danger] = "some error happend"
      redirect_to root_url
    end
  end

  def destroy
    current_user.events_atendees.find_by(events_atendees_params).destroy
    redirect_to event_path(Event.find_by(id:events_atendees_params[:attended_event_id]))
  end

  private
    def events_atendees_params
      params.permit(:attended_event_id)
    end
end
