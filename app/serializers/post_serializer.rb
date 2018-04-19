class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :comment_ids
  has_many :comments

  def comment_ids
  	object.comments.pluck(:id)
  end

end