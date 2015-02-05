require 'httparty'
module WMATA

  class Client
    include HTTParty
    base_uri "https://api.wmata.com"
    def initialize(api_key)
        @options = {query: {api_key: api_key} }
    end

    def next_trains(stations='A06')
      response = self.class.get("/StationPrediction.svc/json/GetPrediction/#{stations}", @options)
      JSON.parse(response.body)["Trains"]
    end

    def train_stations(line='RD', formated=true)
      @options[:query][:LineCode]=line
      response = self.class.get("/Rail.svc/json/jStations", @options)
      JSON.parse(response.body)["Stations"]
    end

    def train_path(from,to)
      @options[:query][:FromStationCode] = from
      @options[:query][:ToStationCode]   = to
      response = self.class.get("/Rail.svc/json/jPath", @options)
      JSON.parse(response.body)["Path"]
    end

    def train_incidents
      response = self.class.get("/Incidents.svc/json/Incidents", @options)
      JSON.parse(response.body)["Incidents"]
    end
  end

end
