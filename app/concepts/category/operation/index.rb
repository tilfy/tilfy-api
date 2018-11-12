class Category::Operation::Index < Application::Operation::Base
  step :model!

  def model!(options, **)
    options[:model] = Category.all.reverse_order
  end
  
end