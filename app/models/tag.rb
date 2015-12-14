class Tag
  include Mongoid::Document
  field :name, type: String
  field :freq, type: Integer
  embedded_in :paper
end