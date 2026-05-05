# frozen_string_literal: true

module Tbx
  # Term component section `<termCompSec>`.
  #
  # Section containing decomposed term components. The `type` attribute
  # indicates the decomposition method.
  #
  # Permitted `type` values (from TermComp-namespace.rng):
  #
  # * `hyphenation` — parts of a term as it would be hyphenated
  # * `lemma` — base form (dictionary entry form)
  # * `morphologicalElement` — individual morphemes comprising the term
  # * `syllabification` — individual syllables comprising the term
  # * `termElement` — any other logically significant portion
  #
  # Schema source: TermComp-namespace.rng `<define name="termCompSec">`
  class TermCompSec < Lutaml::Model::Serializable
    TYPES = {
      hyphenation: "hyphenation",
      lemma: "lemma",
      morphological_element: "morphologicalElement",
      syllabification: "syllabification",
      term_element: "termElement",
    }.freeze

    attribute :id, :string
    attribute :type, :string
    attribute :note, ::Tbx::Note, collection: true
    attribute :term_comp, ::Tbx::TermComp, collection: true
    attribute :term_comp_grp, ::Tbx::TermCompGrp, collection: true

    xml do
      root "termCompSec"
      mixed_content
      namespace ::Tbx::Namespace

      map_attribute "id", to: :id
      map_attribute "type", to: :type
      map_element "note", to: :note
      map_element "termComp", to: :term_comp
      map_element "termCompGrp", to: :term_comp_grp
    end
  end
end
