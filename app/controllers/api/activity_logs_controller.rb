class Api::ActivityLogsController < ApplicationController

  def index
    @baby_activities = ActivityLog.find_by_baby_id(params[:baby_id])
    respond_to do |format|
      format.json { render :json => @baby_activities }
    end
  end
end
