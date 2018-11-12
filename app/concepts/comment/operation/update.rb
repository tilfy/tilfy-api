class Comment::Operation::Update < Application::Operation::Base
  step :model!
  step :contract_build!
  step :contract_validate
  step :contract_persist!

  def model!(options, params:, **)
    options[:model] = Comment.find(params['id'])
  end

  def contract_build!(options, model:, **)
    options['contract.default'] = Comment::Contract::Update.new(model)
  end

  def contract_validate(options, params:, **)
    options['contract.default'].validate(params['data'])
  end

  def contract_persist!(options, **)
    options['contract.default'].save
  end
end