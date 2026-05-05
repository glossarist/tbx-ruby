# frozen_string_literal: true

module Tbx
  # Date element `<date>`.
  #
  # Records when a transaction occurred. Content must be a valid XML Schema
  # `date` (YYYY-MM-DD) or `dateTime` (YYYY-MM-DDThh:mm:ss) value.
  #
  # Schema source: TBXcoreStructV03.rng `<define name="date">`
  class DateElement < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :content, :string

    xml do
      root "date"
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      map_content to: :content
    end
  end
end
