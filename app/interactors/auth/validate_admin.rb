module Auth
class ValidateAdmin
  include Interactor

    def call
      token = context.token.to_s
      secret = ENV['SECRET_KEY']
      unless token.present? && ActiveSupport::SecurityUtils.secure_compare(token, secret)
        context.fail!(errors: ['Unauthorized'], status: :unauthorized)
      end
    end
  end
end
