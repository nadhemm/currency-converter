require 'money/bank/currencylayer_bank'

# default config for Curency layer
mclb = Money::Bank::CurrencylayerBank.new
# TODO: Read access key from private env file
mclb.access_key = 'dc6376526511f16bd11c5ad1f0cd9628'
mclb.update_rates(true)
mclb.cache = 'mclb_cache_file'
Money.default_bank = mclb

class ApplicationController < Sinatra::Base
  # This configuration part will inform the app where to search for the views and from where it will serve the static files
  configure do
    set :views, "app/views"
    set :public_dir, "public"
  end

  get '/' do
    # Home page redirects to conversion page
    redirect "/convert"
  end

  get '/convert' do
    # Load convert page with a random default input value
		@input_amount = 1
    erb :convert
  end

  post '/convert' do

    # Load params from the form
    @from_currency = params[:from_currency]
    @to_currency = params[:to_currency]
    @input_amount = params[:input_amount].to_i
    # Convert using currency-layer gem
    @output_amount = Money.new(100 * @input_amount, @from_currency).exchange_to(@to_currency).to_f.round(3)
    # Save the model to db
    @conversion = Conversion.create(
        :from_currency => @from_currency,
        :to_currency => @to_currency,
        :input_amount => @input_amount.to_f,
        :output_amount => @output_amount.to_f,
        :created_at => Time.now
    )
    erb :convert
  end

  get '/history' do
    # Load all conversions from the db
    # TODO: add more filters..
    @conversions = Conversion.all()
    erb :history
  end

end