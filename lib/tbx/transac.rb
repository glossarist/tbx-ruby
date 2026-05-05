# frozen_string_literal: true

module Tbx
  # Transaction element `<transac>`.
  #
  # Records an action performed on a terminological entry. The content
  # indicates the type of transaction (origination or modification).
  #
  # Permitted `type` values:
  #
  # * Basic module: `transactionType` (picklist: `origination`, `modification`)
  #
  # Content is plain text only (no inline elements per the core RNG).
  #
  # Schema source: TBXcoreStructV03.rng `<define name="transac">`;
  # data category: Basic.tbxmd.
  class Transac < Lutaml::Model::Serializable
    include Tbx::DataElement

    TYPES = Modules::Basic::TRANSAC_TYPES.freeze
    VALUES = Modules::Basic::TRANSAC_VALUES.freeze

    xml do
      root "transac"
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
