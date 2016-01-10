class Category
  include Mongoid::Document
  include Mongoid::Tree
  include Mongoid::Slug
  has_many :papers
  field :name, type: String
  index({name: 1},{unique: true})
  slug :name
  mount_uploader :picture,CategoryPictureUploader
end