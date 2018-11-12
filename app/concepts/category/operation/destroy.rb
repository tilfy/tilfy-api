class Category::Operation::Destroy < Application::Operation::Base
  step Model(Category, :find)
  step :destroy!

  def destroy!(options, model:, **)
    model.destroy
  end
end