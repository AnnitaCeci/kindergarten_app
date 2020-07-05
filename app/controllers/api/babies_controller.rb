class Api::BabiesController < ApplicationController

  def index
    @babies = Baby.all
    respond_to do |format|
      format.json { render :json => @babies }
    end
  end
end