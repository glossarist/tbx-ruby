# frozen_string_literal: true

module Tbx
  # Transaction note element `<transacNote>`.
  #
  # Provides additional information about a transaction, typically identifying
  # the person or organization responsible.
  #
  # Permitted `type` values:
  #
  # * Basic module: `responsibility` — person/org responsible for the
  #   transaction (DC-451)
  #
  # Content is plain text only (no inline elements per the core RNG).
  #
  # Schema source: TBXcoreStructV03.rng `<define name="transacNote">`;
  # data category: Basic.tbxmd.
  class TransacNote < Lutaml::Model::Serializable
    include Tbx::DataElement

    TYPES = Modules::Basic::TRANSAC_NOTE_TYPES.freeze

    xml do
      root "transacNote"
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
