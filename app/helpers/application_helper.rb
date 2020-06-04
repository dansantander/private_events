module ApplicationHelper
  def past
    events = Event.all
    @prev_event = []

    events.each do |ev|
      @prev_event << ev if ev.event_date.past?
    end

    @prev_event
  end

  def upcoming
    events = Event.all
    @upcoming_event = []

    events.each do |ev|
      @upcoming_event << ev unless ev.event_date.past?
    end

    @upcoming_event
  end
end
