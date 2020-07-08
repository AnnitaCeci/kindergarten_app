class Api::ActivitiesController < Api::ApiController


  def index
    @activities = Activity.all
    render json: @activities
  end

end