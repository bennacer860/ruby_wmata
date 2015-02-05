require 'spec_helper'
#require 'pry'
describe WMATA do
  before(:all) { WMATA.api = 'xxxxx'  }
  
  it 'should predict next trains' do
    expect(WMATA).to respond_to :next_trains
    expect(WMATA.next_trains).not_to be_empty
    ["Car","Min","DestinationName"].each{ |field|
      expect(WMATA.next_trains.first[field]).not_to be_nil
    }
  end

  it 'should give a list of all train stations ' do
    expect(WMATA).to respond_to :train_stations   
    expect(WMATA.train_stations).not_to be_empty 
    ["Code","Name","LineCode1","Address"].each {|field|
      expect(WMATA.train_stations.first[field]).not_to be_nil
    }
  end            

  it 'should give path from station to another ' do
    expect(WMATA).to respond_to :train_path 
    expect(WMATA.train_path("A02","A01")).not_to be_empty 
    path = WMATA.train_path("A02","A01")
    #binding.pry
    ["LineCode","SeqNum","StationCode","StationName"].each{|field|
      #puts "#{field} "#=> #{path.first[field]}" 
      expect(path.first[field]).not_to be_nil 
    }
  end


  it 'should give rails incidents' do
    expect(WMATA).to respond_to :train_incidents
    expect(WMATA.train_incidents).not_to be_empty 
  end
=begin
   def rail_incidents(self):
        return self._get('Incidents', 'Incidents')
=end
end
