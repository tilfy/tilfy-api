class Category::Operation::Show < Application::Operation::Base
  step :model!

  def model!(options, params:, **)
    options[:model] = Category.find(params['id'])
  end
end