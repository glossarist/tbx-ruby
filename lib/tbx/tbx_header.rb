# frozen_string_literal: true

module Tbx
  class TbxHeader < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :file_desc, ::Tbx::FileDesc
    attribute :encoding_desc, ::Tbx::EncodingDesc
    attribute :revision_desc, ::Tbx::RevisionDesc

    xml do
      root "tbxHeader"
      mixed_content
      namespace ::Tbx::Namespaces::TbxNamespace

      map_attribute "id", to: :id
      map_element "fileDesc", to: :file_desc
      map_element "encodingDesc", to: :encoding_desc
      map_element "revisionDesc", to: :revision_desc
    end
  end
end
