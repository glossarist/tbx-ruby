# frozen_string_literal: true

module Tbx
  class FileDesc < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :publication_stmt, ::Tbx::PublicationStmt
    attribute :title_stmt, ::Tbx::TitleStmt
    attribute :source_desc, ::Tbx::SourceDesc

    xml do
      root "fileDesc"
      mixed_content
      namespace ::Tbx::Namespaces::TbxNamespace

      map_attribute "id", to: :id
      map_element "publicationStmt", to: :publication_stmt
      map_element "titleStmt", to: :title_stmt
      map_element "sourceDesc", to: :source_desc
    end
  end
end
