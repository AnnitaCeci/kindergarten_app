class Api::BabiesController < ApiController

  def index
    @babies = Baby.all
    render json: @babies
  end
end