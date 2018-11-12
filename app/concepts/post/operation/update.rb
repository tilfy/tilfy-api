class Post::Operation::Update < Application::Operation::Base
  step Model(Post, :find)
  step Contract::Build(constant: Post::Contract::Update)
  step :contract_validate
  step Contract::Persist()

  def contract_validate(options, params:, **)
    options['contract.default'].validate(params['data'])
  end
end