require 'data_mapper'

class Tag
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :links, through: Resource
  #BOTH PARTNERS IN A MANY TO MANY RELATIONSHIP NEED TO KNOW ABOUT EACH OTHER
end
