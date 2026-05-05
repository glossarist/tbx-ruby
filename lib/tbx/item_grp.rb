# frozen_string_literal: true

module Tbx
  # Item group `<itemGrp>` associating a picklist item with administrative data.
  #
  # Groups an `item` with its associated administrative data, notes,
  # references, and transaction records.
  #
  # Schema source: TBXcoreStructV03.rng `<define name="itemGrp">`
  class ItemGrp < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :item, ::Tbx::Item
    attribute :admin, ::Tbx::Admin, collection: true
    attribute :admin_grp, ::Tbx::AdminGrp, collection: true
    attribute :note, ::Tbx::Note, collection: true
    attribute :ref, ::Tbx::Ref, collection: true
    attribute :transac_grp, ::Tbx::TransacGrp, collection: true
    attribute :xref, ::Tbx::Xref, collection: true

    xml do
      root "itemGrp"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      map_element "item", to: :item
      map_element "admin", to: :admin
      map_element "adminGrp", to: :admin_grp
      map_element "note", to: :note
      map_element "ref", to: :ref
      map_element "transacGrp", to: :transac_grp
      map_element "xref", to: :xref
    end
  end
end
