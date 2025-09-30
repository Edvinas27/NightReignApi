module Auth
class CreateClientToken
  include Interactor

    def call
      client_id = context.params[:client_id]
      expiration = 1.hours.from_now.to_i

      if client_id.blank?
        context.fail!(errors: ["client_id is required"], status: :bad_request)
      end

      payload = {
        client_id: client_id,
        exp: expiration
      }

      context.token = JWT.encode(payload, ENV['SECRET_KEY'], 'HS256')
    end
  end
end
