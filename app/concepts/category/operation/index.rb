class Category::Operation::Index < BaseOperation
  step :model!

  def model!(options, **)
    options[:model] = Category.all.reverse_order
  end
  
end