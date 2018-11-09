class Category::Operation::Show < BaseOperation
  step :model!

  def model!(options, params:, **)
    options[:model] = Category.find(params['id'])
  end
end