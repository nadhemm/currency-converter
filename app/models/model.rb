# this is a simple model example
# check https://datamapper.org/getting-started.html
# class Model
#   include DataMapper::Resource
#
#   property :id, Serial # An auto-increment integer key
#   property :title, String # A varchar type string, for short strings
# end


class Currency
  include DataMapper::Resource

  property :id, Serial # An auto-increment integer key
  property :name, String
  property :acronym, Text

  has n, :conversions
  has n, :conversions
end

class Conversion
  include DataMapper::Resource

  property :id, Serial
  # property :from_currency, String
  # property :to_currency, String
  property :created_at, DateTime
  belongs_to :currency
  belongs_to :currency

end

DataMapper.finalize

require  'dm-migrations'
