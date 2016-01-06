class Paper
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::TagsArentHard   
  include Mongoid::Commentable  
  has_and_belongs_to_many :researchers  
  belongs_to :category
  
  field :title
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

  validates_presence_of :title, :abstract, :introduction, :valuation, :conclusion
  #  searchkick language: "arabic"
end

