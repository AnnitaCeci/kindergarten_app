class Api::AssistantsController < Api::ApiController
  def index
    @assistants = Assistant.all
    render json: @assistants
  end
end
