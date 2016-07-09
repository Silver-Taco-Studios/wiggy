require 'json'

class SummariseStop
  attr_reader :stop_id

  Stop = Struct.new(:name, :services)
  BusService = Struct.new(:id, :name, :status, :aimed_arrival, :expected_arrival) do |bus|
    def delay
      expected_arrival - aimed_arrival
    end
  end

  def initialize(stop_id)
    @stop_id = stop_id
  end

  def call
    data
    sort_data
  end

  private

  def data
    @data ||= JSON.parse(MakeHTTPSRequest.new(url_for_stop).call)
  end

  def sort_data
    name = data['Stop']['Name']
    services = data['Services'].map do |hash|
      bus_service_from_hash(hash) if hash_is_real_time(hash)
    end.compact
    Stop.new(name, services)
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
      DateTime.parse(hash['ExpectedDeparture'])
    )
  end

  def url_for_stop
    @url_for_stop ||= "https://www.metlink.org.nz/api/v1/StopDepartures/#{stop_id}"
  end
end