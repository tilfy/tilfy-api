class UserLike::Operation::Destroy < Application::Operation::Base
  step Model(UserLike, :find)
  step :destroy!

  def destroy!(options, model:, **)
    model.destroy
  end
end