class EventApplicationsController < ApplicationController
  permits :name, :name_ruby, :gender, :email, :phone, :notes

  def index
    @event_applications = EventApplication.all
  end

  def new
    @event_application = EventApplication.new(gender: EventApplication::FEMALE)
  end

  def confirm(event_application)
    @event_application = EventApplication.new(event_application)
    unless @event_application.valid? && params['edit'].blank?
      render(:new)
    end
  end

	def create(event_application)
    @event_application = EventApplication.new(event_application)
    if @event_application.save
      EventApplicationMailer.notify_entry(@event_application).deliver_later
      redirect_to(complete_event_applications_url)
    else
      render(:new)
    end
  end

  def complete
  end

end
