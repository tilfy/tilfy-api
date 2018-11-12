class Reply::Operation::Index < Application::Operation::Base
  step :model!

  def model!(options, params:, **)
    options[:model] = Comment.find(params['comment_id']).replies.reverse_order
  end
end