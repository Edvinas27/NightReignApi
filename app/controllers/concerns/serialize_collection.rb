# frozen_string_literal: true

module SerializeCollection
  extend ActiveSupport::Concern

  private
  # Should only be used where pugy pagination and active model serializers are used
  def serialize_collection(collection, serializer)
    ActiveModel::Serializer::CollectionSerializer.new(collection, serializer: serializer)
  end
end
