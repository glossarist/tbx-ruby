# frozen_string_literal: true

module Tbx
  # A set of items forming a picklist `<itemSet>`.
  #
  # Contains `itemGrp` or `item` children that enumerate individual
  # picklist values.
  #
  # Schema source: TBXcoreStructV03.rng `<define name="itemSet">`
  class ItemSet < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :type, :string
    attribute :item_grp, ::Tbx::ItemGrp, collection: true
    attribute :item, ::Tbx::Item, collection: true

    xml do
      root "itemSet"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      map_attribute "type", to: :type
      map_element "itemGrp", to: :item_grp
      map_element "item", to: :item
    end
  end
end
