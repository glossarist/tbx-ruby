# frozen_string_literal: true

module Tbx
  class RefObjectSec < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :type, :string
    attribute :ref_object, ::Tbx::RefObject, collection: true

    xml do
      root "refObjectSec"
      mixed_content
      namespace ::Tbx::Namespaces::TbxNamespace

      map_attribute "id", to: :id
      map_attribute "type", to: :type
      map_element "refObject", to: :ref_object
    end
  end
end
