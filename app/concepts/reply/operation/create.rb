class Reply::Operation::Create < Application::Operation::Base
  step :model!
  step Contract::Build(constant: Reply::Contract::Create)
  step :contract_validate
  step Contract::Persist()

  def model!(options, params:, **)
    options[:model] = Comment.find(params['comment_id']).replies.new
  end

  def contract_validate(options, params:, **)
    options['contract.default'].validate(params['data'])
  end
end