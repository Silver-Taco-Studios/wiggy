class TravelController < ApplicationController
  def index
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @stop = SummariseStop.new(stop_id).call if stop_id
    respond_to do |format|
      format.js
    end
  end

  private

  def stop_id
    params["stop_id"]
  end
end
