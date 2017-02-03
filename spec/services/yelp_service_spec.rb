require "rails_helper"


describe YelpService do

  it "should hit api.yelp.com" do
    api_response_body = File.read("./spec/cassettes/dominos.json")
    web_response_body = File.read("./spec/cassettes/dominos.html")

    stub_request(:get, /api.yelp.com/).
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3'}).
      to_return(status: 200, body: api_response_body, headers: { "Content-Type" => "application/json; charset=UTF-8"})

    stub_request(:get, /www.yelp.com/).
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3'}).
      to_return(status: 200, body: web_response_body, headers: { "Content-Type" => "text/html; charset=UTF-8"})

    infos = described_class.retrieve_infos_for("domino's")

    expect(infos[:name]).to eq "Domino’s Pizza"
    expect(infos[:address]).to eq "227 W 40th St, Theater District, New York, NY 10018"
    expect(infos[:url]).to eq "https://www.yelp.com/biz/dominos-pizza-new-york-9?adjust_creative=J7Nf3wBYLUtCWx8gOn7Dsg&utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=J7Nf3wBYLUtCWx8gOn7Dsg"
    # TODO: test review array too
  end


end


