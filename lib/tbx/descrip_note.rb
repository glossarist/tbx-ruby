# frozen_string_literal: true

module Tbx
  # Note element associated with a `<descrip>` description.
  #
  # Content is plain text only (no inline elements per the core RNG).
  #
  # Schema source: TBXcoreStructV03.rng `<define name="descripNote">`
  class DescripNote < Lutaml::Model::Serializable
    include Tbx::DataElement

    xml do
      root "descripNote"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      w3c_attributes :lang
      map_attribute "target", to: :target
      map_attribute "datatype", to: :datatype
      map_attribute "type", to: :type
      map_content to: :content
    end
  end
end
