class GetQualities
  include Interactor

  def call
    context.qualities = Quality.all
  end
end
