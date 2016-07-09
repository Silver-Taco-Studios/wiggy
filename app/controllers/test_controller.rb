class TestController < ApplicationController
  def index
    @stop = SummariseStop.new(7918).call
  end
end
