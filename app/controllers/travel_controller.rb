class TravelController < ApplicationController
  def index
    @stop = SummariseStop.new(stop_id).call if stop_id.present?
    respond_to do |format|
      format.js
      format.html
    end
  end

  def stop_info
    @stop = SummariseStop.new(stop_id).call if stop_id.present?
    respond_to do |format|
      format.js
    end
  end

  private

  def stop_id
    params["stop_id"]
  end
end
