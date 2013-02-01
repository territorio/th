class CategoriesController < ApplicationController

  before_filter :by_ids, :only => :index 
  #before_filter :by_ids, :only => :index , :if => proc { |params| params[:ids] }
  respond_to :json


  def index
    respond_with(collection)
  end

  def show
    respond_with(@category = Category.find(params[:id]))
  end


  private 
  def collection
    @collection ||= Category.unscoped
  end

  def by_ids

    puts "calling by ids #{params[:ids]}"
    collection.where :id => params[:ids] if params[:ids]

  end

  #def collection=(collection)
  #  @collection = collection
  #end

end
