class Post::Operation::Show < BaseOperation
  step :model!

  def model!(options, params:, **)
    options[:model] = Post.find(params['id'])
  end
end