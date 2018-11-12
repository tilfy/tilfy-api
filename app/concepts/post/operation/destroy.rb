class Post::Operation::Destroy < Application::Operation::Base
  step Model(Post, :find)
  step :destroy!

  def destroy!(options, model:, **)
    model.destroy
  end
end