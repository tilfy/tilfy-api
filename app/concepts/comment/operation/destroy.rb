class Comment::Operation::Destroy < Application::Operation::Base
  step Model(Comment, :find)
  step :destroy!

  def destroy!(options, model:, **)
    model.destroy
  end
end