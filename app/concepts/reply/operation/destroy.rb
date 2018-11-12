class Reply::Operation::Destroy < Application::Operation::Base
  step Model(Reply, :find)
  step :destroy!

  def destroy!(options, model:, **)
    model.destroy
  end
end