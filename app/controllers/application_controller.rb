require 'money/bank/currencylayer_bank'
mclb = Money::Bank::CurrencylayerBank.new
mclb.access_key = '125aad7f1a6b30553506d370d6310216'
mclb.update_rates

class ApplicationController < Sinatra::Base
	# This configuration part will inform the app where to search for the views and from where it will serve the static files
  	configure do
    	set :views, "app/views"
    	set :public_dir, "public"
  	end

  	get '/' do
   		erb :convert
  	end

		get '/convert' do
			erb :convert
		end

		post '/convert' do
			@input_amount = params[:input_amount]
			# @from_currency = params[:title]
			@conversion = Conversion.create(
					:from_currency      => "test_from",
					:to_currency       => "test_to",
					:input_amount      => @input_amount.to_f,
					# :output_amount      => "test_from",
					:created_at => Time.now
			)
			@to_amount = "5000$"
			erb :convert
  	end

end


