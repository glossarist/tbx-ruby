# frozen_string_literal: true

require "lutaml/model"
require_relative "tbx/version"

module Tbx
  autoload :Namespace, "#{__dir__}/tbx/namespace"

  # Inline elements
  autoload :Ec, "#{__dir__}/tbx/ec"
  autoload :Foreign, "#{__dir__}/tbx/foreign"
  autoload :Hi, "#{__dir__}/tbx/hi"
  autoload :Ph, "#{__dir__}/tbx/ph"
  autoload :Sc, "#{__dir__}/tbx/sc"

  # Text elements
  autoload :Note, "#{__dir__}/tbx/note"
  autoload :P, "#{__dir__}/tbx/p"
  autoload :Title, "#{__dir__}/tbx/title"

  # Data elements
  autoload :Admin, "#{__dir__}/tbx/admin"
  autoload :AdminGrp, "#{__dir__}/tbx/admin_grp"
  autoload :AdminNote, "#{__dir__}/tbx/admin_note"
  autoload :Descrip, "#{__dir__}/tbx/descrip"
  autoload :DescripGrp, "#{__dir__}/tbx/descrip_grp"
  autoload :DescripNote, "#{__dir__}/tbx/descrip_note"
  autoload :Ref, "#{__dir__}/tbx/ref"
  autoload :TermNote, "#{__dir__}/tbx/term_note"
  autoload :TermNoteGrp, "#{__dir__}/tbx/term_note_grp"
  autoload :Transac, "#{__dir__}/tbx/transac"
  autoload :TransacGrp, "#{__dir__}/tbx/transac_grp"
  autoload :TransacNote, "#{__dir__}/tbx/transac_note"
  autoload :Xref, "#{__dir__}/tbx/xref"

  # Date
  autoload :DateElement, "#{__dir__}/tbx/date"

  # Reference elements
  autoload :Item, "#{__dir__}/tbx/item"
  autoload :ItemGrp, "#{__dir__}/tbx/item_grp"
  autoload :ItemSet, "#{__dir__}/tbx/item_set"
  autoload :RefObject, "#{__dir__}/tbx/ref_object"
  autoload :RefObjectSec, "#{__dir__}/tbx/ref_object_sec"

  # Structural elements
  autoload :Term, "#{__dir__}/tbx/term"
  autoload :TermSec, "#{__dir__}/tbx/term_sec"
  autoload :LangSec, "#{__dir__}/tbx/lang_sec"
  autoload :ConceptEntry, "#{__dir__}/tbx/concept_entry"
  autoload :Body, "#{__dir__}/tbx/body"
  autoload :TextElement, "#{__dir__}/tbx/text_element"
  autoload :Back, "#{__dir__}/tbx/back"

  # Header elements
  autoload :Change, "#{__dir__}/tbx/change"
  autoload :EncodingDesc, "#{__dir__}/tbx/encoding_desc"
  autoload :FileDesc, "#{__dir__}/tbx/file_desc"
  autoload :PublicationStmt, "#{__dir__}/tbx/publication_stmt"
  autoload :RevisionDesc, "#{__dir__}/tbx/revision_desc"
  autoload :SourceDesc, "#{__dir__}/tbx/source_desc"
  autoload :TitleStmt, "#{__dir__}/tbx/title_stmt"
  autoload :TbxHeader, "#{__dir__}/tbx/tbx_header"

  # Root
  autoload :Document, "#{__dir__}/tbx/document"
end
