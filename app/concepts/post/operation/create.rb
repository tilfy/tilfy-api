class Post::Operation::Create < Application::Operation::Base
  step :model!
  step :contract_build!
  step :contract_validate
  step :contract_persist!

  def model!(options, **)
    options[:model] = Post.new
  end

  def contract_build!(options, model:, **)
    options['contract.default'] = Post::Contract::Create.new(model)
  end

  def contract_validate(options, params:, **)
    options['contract.default'].validate(params['data'])
  end

  def contract_persist!(options, **)
    options['contract.default'].save
  end

end