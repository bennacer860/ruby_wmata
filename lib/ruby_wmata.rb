$:.unshift(File.dirname(__FILE__))
require 'client'

module WMATA
  def self.client
    @client ||= Client.new(api)
  end

  def self.api
    @api || raise("please set the api key")
  end

  def self.api=(api_key)
    @client = Client.new(api_key)
    @api = api_key
  end

  def self.next_trains(station = "A06")
    client.next_trains(station)
  end

  def self.train_stations(line = 'RD')
    client.train_stations(line)
  end

  def self.train_path(from,to)
    client.train_path(from,to)
  end

  def self.train_incidents
    client.train_incidents
  end
end
