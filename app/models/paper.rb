class Paper
  include Mongoid::Document
  include Mongoid::Timestamps
  has_and_belongs_to_many :researcher
  embeds_many :tags
  field :title
  field :content
  field :state
  validates_presence_of :title
end