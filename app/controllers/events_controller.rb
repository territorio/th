class EventsController < ApplicationController

  before_filter :by_ids, :only => :index 
  respond_to :json


  def index
    respond_with(collection)
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

  def by_ids
    self.collection = collection.where(:id => params[:ids]) if params[:ids]
  end

end
