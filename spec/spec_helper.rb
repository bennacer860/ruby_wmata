$:.unshift 'lib'
require 'ruby_wmata'
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)


RSpec.configure do |config|

    config.before(:each) do
      stub_request(:get, %r|https://api.wmata.com/StationPrediction.svc/json/GetPrediction/|).
        to_return(status: 200, body: File.open("./spec/fixtures/next_trains.json"){|f| f.read}, headers: {})

      stub_request(:get, %r|https://api.wmata.com/Rail.svc/json/jStations|).
        to_return(status: 200, body: File.open("./spec/fixtures/train_stations.json"){|f| f.read}, headers: {})

      stub_request(:get, %r|https://api.wmata.com/Rail.svc/json/jPath|).
        to_return(status: 200, body: File.open("./spec/fixtures/train_path.json"){|f| f.read}, headers: {})

      stub_request(:get, %r|https://api.wmata.com/Incidents.svc/json/Incidents|).
        to_return(status: 200, body: File.open("./spec/fixtures/train_incidents.json"){|f| f.read}, headers: {})

    end
end
