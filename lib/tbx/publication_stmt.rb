# frozen_string_literal: true

module Tbx
  class PublicationStmt < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :p, ::Tbx::P, collection: true

    xml do
      root "publicationStmt"
      mixed_content
      namespace ::Tbx::Namespaces::TbxNamespace

      map_attribute "id", to: :id
      map_element "p", to: :p
    end
  end
end
