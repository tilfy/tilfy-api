class Reply::Operation::Destroy < BaseOperation
  step :model!
  step :destroy!

  def model!(options, params:, **)
    options[:model] = Reply.find(params['id'])
  end

  def destroy!(options, model:, **)
    model.destroy
  end
end