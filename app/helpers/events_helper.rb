module EventsHelper
  def event_params
    params.require(:event).permit(:title, :event_date, :user_id)
  end
end
