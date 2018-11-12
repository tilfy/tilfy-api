class Reply::Operation::Update < Application::Operation::Base
  step Model(Reply, :find)
  step Contract::Build(constant: Reply::Contract::Update)
  step :contract_validate
  step Contract::Persist()

  def contract_validate(options, params:, **)
    options['contract.default'].validate(params['data'])
  end
end