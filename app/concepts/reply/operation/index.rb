class Reply::Operation::Index < BaseOperation
  step :model!

  def model!(options, params:, **)
    options[:model] = Comment.find(params['comment_id']).replies.reverse_order
  end
end