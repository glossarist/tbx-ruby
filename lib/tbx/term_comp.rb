# frozen_string_literal: true

module Tbx
  # A single component of a decomposed term `<termComp>`.
  #
  # Used for representing hyphenation, syllabification, morphological
  # elements, lemmata, or other logically significant portions of a term.
  # Content is plain text only.
  #
  # Schema source: TermComp-namespace.rng `<define name="termComp">`
  class TermComp < Lutaml::Model::Serializable
    attribute :id, :string
    attribute :lang, Lutaml::Xml::W3c::XmlLangType
    attribute :content, :string, collection: true

    xml do
      root "termComp"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      w3c_attributes :lang
      map_content to: :content
    end
  end
end
