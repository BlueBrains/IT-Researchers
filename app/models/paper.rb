class Paper
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :researcher
  field :title
  field :content  
  field :state
  validates_presence_of :title
  field :_id, type: String, default: ->{ title }
end
