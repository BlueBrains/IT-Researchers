class Paper
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::TagsArentHard   
  include Mongoid::Commentable
  include Mongoid::Slug
  has_and_belongs_to_many :researchers  
  has_many :post_attachments
  accepts_nested_attributes_for :post_attachments
  belongs_to :category
  accepts_nested_attributes_for :comments
  
  field :title
  slug :title
  field :abstract
  field :introduction
  field :literature_survey
  field :notation
  field :theory
  field :specification
  field :implementation
  field :valuation
  field :related_work
  field :further_work
  field :conclusion
  field :appendices
  
  field :state

  field :active, type: Boolean do
    formatted_value do
      bindings[:object].paper.activate_msg
    end
  end

  field :likers, type: Array
  field :likes, type: Integer
  field :times_seen, type: Integer
  taggable_with :tags
  taggable_with :keywords

  scope :exclude, -> paper { ne(_id: paper.id) }
  scope :similar_to, -> paper { exclude(paper).in(tags: paper.tags ) }

  def similar
    @similar ||= self.class.similar_to self
  end

  def activate_msg
    puts "it worked"
  end

  validates_presence_of :title, :abstract, :introduction, :valuation, :conclusion
  #  searchkick language: "arabic"
<<<<<<< HEAD
end
=======

end

>>>>>>> 681d745234ef3db4088f71e2104f996d3705e763
