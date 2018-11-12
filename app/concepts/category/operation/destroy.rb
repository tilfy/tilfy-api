class Category::Operation::Destroy < Application::Operation::Base
  step :model!
  step :destroy!

  def model!(options, params:, **)
    options[:model] = Category.find(params['id'])
  end

  def destroy!(options, model:, **)
    model.destroy
  end

end