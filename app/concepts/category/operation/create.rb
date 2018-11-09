class Category::Operation::Create < BaseOperation
  step :model!
  step :contract_build!
  step :contract_validate
  step :contract_persist!

  def model!(options, **)
    options[:model] = Category.new
  end

  def contract_build!(options, **)
    options['contract.default'] = Category::Contract::Default.new(options[:model])
  end

  def contract_validate(options, params:, **)
    options['contract.default'].validate(params['data'])
  end

  def contract_persist!(options, **)
    options['contract.default'].save
  end

end