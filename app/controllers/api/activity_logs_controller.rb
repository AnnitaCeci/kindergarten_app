class Api::ActivityLogsController < ApplicationController

  def index
    @baby_activities = ActivityLog.find_by_baby_id(params[:baby_id])
    respond_to do |format|
      format.json { render :json => @baby_activities }
    end
  end

  def create
    @activity_log = ActivityLog.new(activity_log_params)
    if @activity_log.save!
      render json: @activity_log
    else
      render error: {error: 'Unable to create activity log'}, status: 400
    end
  end


  private

  
  def activity_log_params
    params.require(:activity_log).permit(:activity_id, :baby_id, :assistant_id, :start_time)
  end


end
