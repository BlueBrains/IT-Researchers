class Paper
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::TagsArentHard   
  include Mongoid::Commentable  
  has_and_belongs_to_many :researchers  
  has_many :post_attachments
  accepts_nested_attributes_for :post_attachments
  belongs_to :category
  field :title
  field :content
  field :state
  field :likers, type: Array
  field :likes, type: Integer
  field :times_seen, type: Integer
  validates_presence_of :title  
  taggable_with :tags
  #  searchkick language: "arabic"
end

