class Category::Operation::Create < Application::Operation::Base
  step Model(Category, :new)
  step Contract::Build(constant: Category::Contract::Default)
  step :contract_validate
  step Contract::Persist()

  def contract_validate(options, params:, **)
    options['contract.default'].validate(params['data'])
  end
end