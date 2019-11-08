require 'money/bank/currencylayer_bank'

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
			mclb = Money::Bank::CurrencylayerBank.new
			mclb.access_key = '125aad7f1a6b30553506d370d6310216'
			mclb.update_rates(true)

			mclb.cache = 'mclb_cache_file'
			Money.default_bank = mclb

			@from_currency = "USD"
			@to_currency = "EUR"
			@input_amount = params[:input_amount]
			@output_amount = Money.new(100, 'USD').exchange_to('EUR').to_f
			puts "conv: #{@output_amount}"
			@conversion = Conversion.create(
					:from_currency      => @from_currency,
					:to_currency       => @to_currency,
					:input_amount      => @input_amount.to_f,
					:output_amount      => @output_amount.to_f,
					:created_at => Time.now
			)
			erb :convert
  	end
		get '/history' do
			@conversations = Conversion.all()
			for conversation in @conversations do
				puts "here : #{conversation.input_amount}"
			end
			erb :history
		end

end


