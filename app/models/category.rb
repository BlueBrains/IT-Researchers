class Category
  include Mongoid::Document
  has_many :papers
  field :name, type: String
end