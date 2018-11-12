class Category::Contract::Default < Application::Contract::Base
  property :name

  validation with: { form: true } do
    configure { config.messages = :i18n }

    configure do
      def unique?(attr_name, value)
        Category.where("LOWER(#{attr_name}) = ?", value.downcase).empty?
      end
    end

    required(:name).filled(unique?: :name)
  end
end