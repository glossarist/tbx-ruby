# frozen_string_literal: true

module Tbx
  # Administrative note element `<adminNote>`.
  #
  # Provides notes about administrative data. Content is plain text only
  # (no inline elements per the core RNG).
  #
  # Permitted `type` values:
  #
  # * Linguist module: `readingNote` — note about a term's reading/pronunciation
  #
  # Schema source: TBXcoreStructV03.rng `<define name="adminNote">`;
  # data category: Linguist.tbxmd.
  class AdminNote < Lutaml::Model::Serializable
    include Tbx::DataElement

    TYPES = Modules::Linguist::ADMIN_NOTE_TYPES.freeze

    xml do
      root "adminNote"
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
