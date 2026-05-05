# frozen_string_literal: true

module Tbx
  class Back < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :ref_object_sec, ::Tbx::RefObjectSec, collection: true

    xml do
      root "back"
      mixed_content
      namespace ::Tbx::Namespaces::TbxNamespace

      map_attribute "id", to: :id
      map_element "refObjectSec", to: :ref_object_sec
    end
  end
end
