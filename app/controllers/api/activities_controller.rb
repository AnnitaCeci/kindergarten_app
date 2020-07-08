
class Api::ActivitiesController < ApiController


  def index
    @activities = Activity.all
    render json: @activities
  end

end