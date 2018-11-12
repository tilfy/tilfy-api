class Post::Operation::Destroy < Application::Operation::Base
  step :model!
  step :destroy!

  def model!(options, params:, **)
    options[:model] = Post.find(params['id'])
  end

  def destroy!(options, model:, **)
    model.destroy
  end
end