# frozen_string_literal: true

module Tbx
  # Descriptive data category element `<descrip>`.
  #
  # Carries conceptual and contextual information about a term, including
  # definitions, subject field classifications, and usage contexts.
  #
  # Permitted `type` values (composed from all modules):
  #
  # * Min module: `subjectField` — field of special knowledge (DC-489),
  #   level: conceptEntry
  # * Basic module: `context` — text illustrating term usage (DC-149),
  #   level: termSec; `definition` — narrative statement of concept (DC-168),
  #   level: conceptEntry/langSec
  #
  # Content model: `entity.noteText` (mixed text + inline elements hi, ec,
  # foreign, ph, sc).
  #
  # Schema source: TBXcoreStructV03.rng `<define name="descrip">`;
  # data categories: Min.tbxmd, Basic.tbxmd.
  class Descrip < Lutaml::Model::Serializable
    include Tbx::DataElement
    include Tbx::DataElement::InlineContent

    TYPES = Modules::Min::DESCRIP_TYPES
      .merge(Modules::Basic::DESCRIP_TYPES).freeze

    xml do
      root "descrip"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      w3c_attributes :lang
      map_attribute "target", to: :target
      map_attribute "datatype", to: :datatype
      map_attribute "type", to: :type
      map_content to: :content
      map_element "hi", to: :hi
      map_element "ec", to: :ec
      map_element "foreign", to: :foreign
      map_element "ph", to: :ph
      map_element "sc", to: :sc
    end
  end
end
