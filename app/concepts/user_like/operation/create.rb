class UserLike::Operation::Create < Application::Operation::Base
  step :model!
  step Contract::Build(constant: UserLike::Contract::Create)
  step :contract_validate
  step Contract::Persist()

  def model!(options, params:, **)
    options[:model] = Post.find(params['post_id']).user_likes.new
  end

  def contract_validate(options, params:, **)
    options['contract.default'].validate(params['data'])
  end
end