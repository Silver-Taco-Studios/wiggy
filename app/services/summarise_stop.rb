require 'json'

class SummariseStop
  attr_reader :stop_id

  Stop = Struct.new(:id, :name, :services)
  BusService = Struct.new(:id, :name, :status, :aimed_arrival, :expected_arrival)

  def initialize(stop_id)
    @stop_id = stop_id
  end

  def call
    sort_data
  end

  private

  def data
    @data ||= JSON.parse(MakeHTTPSRequest.new(url_for_stop).call)
  end

  def sort_data
    name = data['Stop']['Name']
    services = data['Services'].map do |hash|
      bus_service_from_hash(hash)
    end.compact
    Stop.new(stop_id, name, services)
  end

  def hash_is_real_time(hash)
    hash["IsRealtime"]
  end

  def bus_service_from_hash(hash)
    BusService.new(
      hash['ServiceID'],
      hash['Service']['Name'],
      hash['DepartureStatus'],
      DateTime.parse(hash['AimedArrival']),
      DateTime.parse(hash['DisplayDeparture'])
    )
  end

  def url_for_stop
    @url_for_stop ||= "https://www.metlink.org.nz/api/v1/StopDepartures/#{stop_id}"
  end
end