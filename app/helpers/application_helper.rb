module ApplicationHelper
  def past
    events = Event.all
    @prev_event = []

    events.each {|ev|
      @prev_event <<  ev if ev.event_date.past?
    }
    
    @prev_event
  end

  def upcoming
    events = Event.all
    @upcoming_event = []

    events.each {|ev|
      @upcoming_event <<  ev if !ev.event_date.past?
    }
    
    @upcoming_event
  end
end
