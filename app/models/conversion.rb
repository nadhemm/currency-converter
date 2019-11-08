class Conversion
  include DataMapper::Resource

  property :id, Serial
  property :from_currency, String
  property :to_currency, String
  property :input_amount, Float
  property :output_amount, Float
  property :created_at, DateTime

end

DataMapper.auto_upgrade!


DataMapper.finalize
