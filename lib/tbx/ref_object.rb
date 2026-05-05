# frozen_string_literal: true

module Tbx
  class RefObject < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :item_set, ::Tbx::ItemSet, collection: true
    attribute :item_grp, ::Tbx::ItemGrp, collection: true
    attribute :item, ::Tbx::Item, collection: true

    xml do
      root "refObject"
      mixed_content
      namespace ::Tbx::Namespaces::TbxNamespace

      map_attribute "id", to: :id
      map_element "itemSet", to: :item_set
      map_element "itemGrp", to: :item_grp
      map_element "item", to: :item
    end
  end
end
