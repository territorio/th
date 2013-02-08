class EventsController < ApplicationController

  before_filter :by_ids, :only => :index 
  before_filter :by_category, :only => :index 
  before_filter :by_date, :only => :index 
  respond_to :json
  

  def index
    respond_with(collection.uniq)
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

  def by_category

    if params[:category]
      self.collection = collection.joins(:categories).where(:categories => {:id => params[:category]})
    end

  end

  def by_ids
    self.collection = collection.where(:id => params[:ids]) if params[:ids]
  end

  def by_date

    if params[:date]

      query = "is_regular = :is_regular AND ( ( start_date = :date AND end_date IS NULL) OR (:date >= start_date AND :date <= end_date) )"

      self.collection = collection.where(query, {:date => params[:date], :is_regular => true})

    end

  end

end
