class Category::Operation::Show < Application::Operation::Base
  step Model(Category, :find)
end