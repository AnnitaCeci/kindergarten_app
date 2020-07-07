class Api::BabiesController < ApplicationController

  def index
    @babies = Baby.all
    render json: @babies
  end
end