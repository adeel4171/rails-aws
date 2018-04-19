class CommentSerializer < ActiveModel::Serializer
  attributes :id, :message, :custom
  belongs_to :post

  def custom
  	"Hello Custom Attribute!! #{object.message}"
  end

end