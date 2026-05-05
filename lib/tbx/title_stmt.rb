# frozen_string_literal: true

module Tbx
  class TitleStmt < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :lang, Lutaml::Xml::W3c::XmlLangType
    attribute :title, ::Tbx::Title
    attribute :note, ::Tbx::Note, collection: true

    xml do
      root "titleStmt"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      w3c_attributes :lang
      map_element "title", to: :title
      map_element "note", to: :note
    end
  end
end
