require 'spec_helper'

# Make sure to create tables in the test database
DataMapper.auto_migrate!

describe 'Currency conversion' do

  it "works!" do
    get '/'
    expect(last_response.status).to eq 302
  end

  it "converts!" do
    get '/convert'
    expect(last_response.status).to eq 200
    expect(last_response.body).to include('<title>Currency converter</title>')

    # TODO: mock the calls or patch the 'Money' class
    post '/convert', input_amount: '10', from_currency: 'USD', to_currency: 'EUR'
    expect(last_response.status).to eq 200
  end

  it "checks history!" do
    get '/history'
    expect(last_response.body).to include(
                                      '<title>History of conversions</title>',
                                      '<table id="history_data_table"'
                                  )
    expect(last_response.status).to eq 200
  end
end