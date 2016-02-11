class EventApplicationsController < ApplicationController
  permits :name, :name_ruby, :gender, :email, :phone, :notes

  def new
    @event_application = EventApplication.new(gender: EventApplication::FEMALE)
  end

  def confirm(event_application)
    @event_application = EventApplication.new(event_application)
    unless @event_application.valid? && params['new'].blank?
      render(:new)
    end
  end

  def create
  end

  def complete
  end

end
