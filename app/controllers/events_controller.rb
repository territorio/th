class EventsController < ApplicationController

  respond_to :json

  def index

    if params[:date]

      self.collection = collection.by_category(params[:category]) if params[:category]
      self.collection = collection.posible_date(params[:date])

      day = Date.parse(params[:date]).strftime("%A").downcase

      self.collection = collection.send("check_#{day}")
      respond_with(collection.uniq)

    elsif params[:ids]

      self.collection = collection.where(:id => params[:ids]) 
      respond_with(collection)

    end

  end

  def show
    respond_with(Event.find(params[:id]))
  end


  private 

  def collection
    @collection ||= Event.unscoped
  end

  def collection=(collection)
    @collection = collection
  end

end
