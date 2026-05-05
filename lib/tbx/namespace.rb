# frozen_string_literal: true

module Tbx
  # XML namespace for TBX elements per ISO 30042:2019.
  #
  # URI: `urn:iso:std:iso:30042:ed-2`
  #
  # All TBX structural elements use this namespace.
  class Namespace < Lutaml::Xml::Namespace
    uri "urn:iso:std:iso:30042:ed-2"
  end
end
