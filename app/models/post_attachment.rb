class PostAttachment
  include Mongoid::Document
  field :paper_id, type: Integer
  field :file, type: String
  mount_uploader :file, AvatarUploader
   belongs_to :paper
end
