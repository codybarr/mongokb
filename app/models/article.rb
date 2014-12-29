class Article
  # for mongoid
  include Mongoid::Document
  # for creation and update times
  include Mongoid::Timestamps
  #include Mongoid::Paperclip
  include Mongoid::Elasticsearch
  # since I keep updating the schema so frequently....
  include Mongoid::Attributes::Dynamic
  # hopefully for versioning
  include Mongoid::Versioning

  field :title, type: String
  field :kba, type: Integer
  field :keywords, type: String
  field :content, type: String
  field :revision_notes, type: String
  field :attachment, type: String

  #has_mongoid_attached_file :files, {
  #  preserve_files: "true",
  #}
  #validates_attachment_file_name :files, :matches => [/js\Z/, /doc?x\Z/, /png\Z/]
  #do_not_validate_attachment_file_type :files

  mount_uploader :attachment, FilesUploader

  scope :kba_sort, -> { order_by([:kba, :asc]) }

  # Relations
  has_and_belongs_to_many :users

  # Elasticsearch
  elasticsearch!
end
