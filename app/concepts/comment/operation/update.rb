class Comment::Operation::Update < Application::Operation::Base
  step Model(Comment, :find)
  step Contract::Build(constant: Comment::Contract::Update)
  step :contract_validate
  step Contract::Persist()

  def contract_validate(options, params:, **)
    options['contract.default'].validate(params['data'])
  end
end