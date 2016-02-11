class EventApplicationsController < ApplicationController

  def new
    @event_application = EventApplication.new
  end

end
