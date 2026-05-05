# frozen_string_literal: true

module Tbx
  # The term designation element `<term>`.
  #
  # Contains the actual term text. Content is limited to plain text and
  # `<hi>` inline highlighting elements per the `entity.basicText` pattern.
  #
  # Schema source: TBXcoreStructV03.rng `<define name="term">`
  class Term < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :content, :string, collection: true
    attribute :hi, ::Tbx::Hi, collection: true

    xml do
      root "term"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      map_content to: :content
      map_element "hi", to: :hi
    end
  end
end
