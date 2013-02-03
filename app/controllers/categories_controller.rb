class CategoriesController < ApplicationController

  before_filter :by_ids, :only => :index 
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

  def collection=(collection)
    @collection = collection
  end

  def by_ids
    self.collection = collection.where(:id => params[:ids]) if params[:ids]
  end

end
