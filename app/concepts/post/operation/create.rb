class Post::Operation::Create < Application::Operation::Base
  step Model(Post, :new)
  step Contract::Build(constant: Post::Contract::Create)
  step :contract_validate
  step Contract::Persist()

  def contract_validate(options, params:, **)
    options['contract.default'].validate(params['data'])
  end
end