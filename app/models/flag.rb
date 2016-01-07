class Flag
  include Mongoid::Document
  embedded_in :paper
  field :reason
  field :flag_date,type: DateTime  
end
