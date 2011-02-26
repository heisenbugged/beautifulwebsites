class WebsitePost
  include Mongoid::Document

  field :title
  field :url
  field :description

  validates_length_of :title, :maximum => 20

  include Mongoid::Paperclip

  has_mongoid_attached_file :thumbnail,
  :styles => {
    :medium => ['262x193#', :jpg]
  },
  :convert_options => { :all => '-background white -flatten +matte' }
end
