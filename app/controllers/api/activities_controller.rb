
class Api::ActivitiesController < ApplicationController

  def index
    @activities = Activity.all
    respond_to do |format|
      format.json { render :json => @activities }
    end
  end

end