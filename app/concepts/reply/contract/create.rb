class Reply::Contract::Create < BaseContract
  property :content
  property :user_id

  validation with: { form: true } do
    configure { config.messages = :i18n }

    configure do
      def user_exists?(user_id)
        User.where(id: user_id).exists?
      end
    end

    required(:content).filled
    required(:user_id).filled(:user_exists?)
  end
end