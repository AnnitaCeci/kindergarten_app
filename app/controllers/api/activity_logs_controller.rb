
class Api::ActivityLogsController < Api::ApiController

  #GET /babies/:id/activity_logs
  def show
    @baby_activities = ActivityLog.find_by_baby_id(params[:baby_id])
    render json: @baby_activities , status: :ok
  end

  # POST /activity_logs
  def create
    @activity_log = ActivityLog.new(activity_log_params)
    begin
      @activity_log.save!
      render json: @activity_log , status: :created
    rescue
      render json: {:errors => @activity_log.errors}, status: :unprocessable_entity
    end
  end

  # PUt /activity_logs/:id
  def update
    @activity_log = ActivityLog.find_by(id: params[:id])
    if @activity_log
      begin
      @activity_log.update!(activity_log_params)
      render json: @activity_log , status: :ok
      rescue
        render json: {:errors => @activity_log.errors}, status: :unprocessable_entity
      end
    else
        render json:  {errors: :not_found}, status: :not_found
      end
  end

  # DELETE /activity_logs/:id
  def destroy
    begin
    @activity_log = ActivityLog.find_by(id: params[:id])
    @activity_log.destroy
    render json: {:message => "Your Log has been deleted"} , status: :ok

    rescue
      render json: {:errors => @activity_log.errors}
    end
  end


  private


  def activity_log_params
    params.require(:activity_log).permit(:activity_id, :baby_id, :assistant_id, :start_time, :stop_time, :duration, :comments)
  end



end
