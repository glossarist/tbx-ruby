# frozen_string_literal: true

module Tbx
  class ItemSet < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :type, :string
    attribute :item_grp, ::Tbx::ItemGrp, collection: true
    attribute :item, ::Tbx::Item, collection: true

    xml do
      root "itemSet"
      mixed_content
      namespace ::Tbx::Namespaces::TbxNamespace

      map_attribute "id", to: :id
      map_attribute "type", to: :type
      map_element "itemGrp", to: :item_grp
      map_element "item", to: :item
    end
  end
end
