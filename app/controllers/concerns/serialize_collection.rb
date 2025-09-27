# frozen_string_literal: true

module SerializeCollection
  extend ActiveSupport::Concern

  private
  def serialize_collection(collection, serializer)
    ActiveModelSerializers::SerializableResource.new(collection, each_serializer: serializer)
  end
end
