require 'net/http'

class MakeHTTPSRequest
  def initialize(request_url)
    @request_url = request_url
  end

  def call
    url = URI.parse(@request_url)
    request = Net::HTTP::Get.new(url.request_uri)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    response = http.start do |h|
      h.verify_mode = OpenSSL::SSL::VERIFY_NONE
      h.request Net::HTTP::Get.new(url.to_s)
    end
    response.body
  end
end