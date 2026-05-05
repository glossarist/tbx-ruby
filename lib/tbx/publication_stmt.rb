# frozen_string_literal: true

module Tbx
  # Publication statement `<publicationStmt>`.
  #
  # Schema source: TBXcoreStructV03.rng `<define name="publicationStmt">`
  class PublicationStmt < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :p, ::Tbx::P, collection: true

    xml do
      root "publicationStmt"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      map_element "p", to: :p
    end
  end
end
