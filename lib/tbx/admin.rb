# frozen_string_literal: true

module Tbx
  # Administrative data category element `<admin>`.
  #
  # Carries administrative metadata about a terminological entry, such as
  # customer subset classification, project association, source attribution,
  # and pronunciation readings.
  #
  # Permitted `type` values (composed from all modules):
  #
  # * Min module: `customerSubset` — entry subset (DC-165)
  # * Basic module: `projectSubset` — project-specific entry subset (DC-406),
  #   `source` — origin of information (DC-471)
  # * Linguist module: `reading` — pronunciation or reading of a term
  #
  # Content model: `entity.noteText` (mixed text + inline elements hi, ec,
  # foreign, ph, sc).
  #
  # Schema source: TBXcoreStructV03.rng `<define name="admin">`;
  # data categories: Min.tbxmd, Basic.tbxmd, Linguist.tbxmd.
  class Admin < Lutaml::Model::Serializable
    include Tbx::DataElement
    include Tbx::DataElement::InlineContent

    TYPES = Modules::Min::ADMIN_TYPES
      .merge(Modules::Basic::ADMIN_TYPES)
      .merge(Modules::Linguist::ADMIN_TYPES).freeze

    xml do
      root "admin"
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
