class Api::BabiesController < Api::ApiController

  def index
    @babies = Baby.all
    render json: @babies
  end
end