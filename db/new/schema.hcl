table "entscheidungsart_rulingtype" {
  schema = schema.public
  column "id" {
    null = false
    type = bigint
  }
  column "entscheidungsart_rulingtype" {
    null = false
    type = character_varying(255)
  }
  column "doktyp_feld" {
    null = false
    type = character_varying(255)
  }
  column "foobar" {
    null = true
    type = integer
  }
  primary_key {
    columns = [column.id]
  }
  index "entscheidungsart_rulingtype_unique" {
    unique  = true
    columns = [column.entscheidungsart_rulingtype]
  }
}
table "evsf_taxlawcollection" {
  schema = schema.public
  column "id" {
    null = false
    type = bigint
  }
  column "dok_docnr" {
    null = false
    type = character_varying(255)
  }
  column "kennungzone_loginzone" {
    null = true
    type = character_varying(255)
  }
  column "kennungausgabe_loginoutput" {
    null = true
    type = character_varying(255)
  }
  column "archivkennung_archivelogin" {
    null = true
    type = character_varying(255)
  }
  column "evsfindex_taxlawindex" {
    null = true
    type = character_varying(1000)
  }
  column "rechteindex_rights" {
    null = true
    type = character_varying(255)
  }
  column "sammlungrechte_collectionright" {
    null = true
    type = character_varying(255)
  }
  primary_key {
    columns = [column.id]
  }
  index "dok_docnr" {
    unique  = true
    columns = [column.dok_docnr]
  }
}
table "gericht_court" {
  schema = schema.public
  column "id" {
    null = false
    type = bigint
  }
  column "gertyp_courttype" {
    null = false
    type = character_varying(255)
  }
  column "gerort_courtplace" {
    null = true
    type = character_varying(255)
  }
  column "region" {
    null = true
    type = character_varying(255)
  }
  column "gerichtsbarkeit_judicature" {
    null = true
    type = character_varying(255)
  }
  column "gueltigab_validfrom" {
    null = true
    type = character_varying(255)
  }
  column "gueltigbis_validto" {
    null = true
    type = character_varying(255)
  }
  column "gerichtanzeige_displaycourt" {
    null = true
    type = character_varying(255)
  }
  column "zuordnung_classification" {
    null    = true
    type    = character_varying(255)
    default = ""
  }
  primary_key {
    columns = [column.id]
  }
  index "gericht_court_columns_unique" {
    unique  = true
    columns = [column.gertyp_courttype, column.gerort_courtplace, column.gueltigab_validfrom, column.gueltigbis_validto]
  }
  index "gericht_court_gerichtsbarkeit_judicature" {
    columns = [column.gerichtsbarkeit_judicature]
  }
  index "gericht_court_gerort_courtplace" {
    columns = [column.gerort_courtplace]
  }
  index "gericht_court_gertyp_courttype" {
    columns = [column.gertyp_courttype]
  }
  index "gericht_court_region" {
    columns = [column.region]
  }
}
table "gerichtsbarkeit_judicature" {
  schema = schema.public
  column "id" {
    null = false
    type = bigint
  }
  column "gerichtsbarkeit_judicature" {
    null = true
    type = character_varying(255)
  }
  column "courttype" {
    null = true
    type = character_varying(255)
  }
  column "index" {
    null = false
    type = character_varying(255)
  }
  primary_key {
    columns = [column.id]
  }
  index "gerichtsbarkeit_judicature_columns_unique" {
    unique  = true
    columns = [column.gerichtsbarkeit_judicature, column.courttype]
  }
}
table "praedikatrminstanz_predrulingsucc" {
  schema = schema.public
  column "id" {
    null = false
    type = bigint
  }
  column "praedikatrminstanz_predrulingsucc" {
    null = false
    type = character_varying(255)
  }
  primary_key {
    columns = [column.id]
  }
  index "praedikatrminstanz_predrulingsucc_unique" {
    unique  = true
    columns = [column.praedikatrminstanz_predrulingsucc]
  }
}
table "quelle_source" {
  schema = schema.public
  column "id" {
    null = false
    type = bigint
  }
  column "quelle_source" {
    null = true
    type = character_varying(255)
  }
  primary_key {
    columns = [column.id]
  }
  index "quelle_source_column_unique" {
    unique  = true
    columns = [column.quelle_source]
  }
  index "quelle_source_index" {
    columns = [column.quelle_source]
  }
}
table "referenceinformation" {
  schema = schema.public
  column "id" {
    null = false
    type = bigint
  }
  column "referenceinformation" {
    null = false
    type = character_varying(255)
  }
  column "full_name" {
    null = false
    type = character_varying(255)
  }
  column "reference_type" {
    null = false
    type = character_varying(255)
  }
  primary_key {
    columns = [column.id]
  }
  index "referenceinformation_unique" {
    unique  = true
    columns = [column.referenceinformation]
  }
}
table "spruchkoerper_courtchamber" {
  schema = schema.public
  column "id" {
    null = false
    type = bigint
  }
  column "gertyp_courttype" {
    null = true
    type = character_varying(255)
  }
  column "spruchkoerper_courtchamber" {
    null = true
    type = character_varying(255)
  }
  primary_key {
    columns = [column.id]
  }
  index "spruchkoerper_courtchamber_columns_unique" {
    unique  = true
    columns = [column.spruchkoerper_courtchamber, column.gertyp_courttype]
  }
}
table "typgesetzeskraft_typelegislative" {
  schema = schema.public
  column "id" {
    null = false
    type = bigint
  }
  column "typgesetzeskraft_typelegislative" {
    null = false
    type = character_varying(255)
  }
  column "full_name" {
    null = false
    type = character_varying(255)
  }
  primary_key {
    columns = [column.id]
  }
  index "typgesetzeskraft_typelegislative_unique" {
    unique  = true
    columns = [column.typgesetzeskraft_typelegislative]
  }
}
table "zuordnung_classification" {
  schema = schema.public
  column "id" {
    null = false
    type = bigint
  }
  column "zuordnung_classification" {
    null = false
    type = character_varying(255)
  }
  column "dokumentation" {
    null = true
    type = boolean
  }
  column "jdv" {
    null = true
    type = character_varying(255)
  }
  column "recht" {
    null = true
    type = character_varying(255)
  }
  column "rgebiet" {
    null = true
    type = character_varying(255)
  }
  column "pushdienst" {
    null = true
    type = character_varying(255)
  }
  column "rgebietfilter" {
    null    = true
    type    = character_varying(255)
    default = ""
  }
  primary_key {
    columns = [column.id]
  }
  index "jdv_unique" {
    unique  = true
    columns = [column.jdv]
  }
}
schema "public" {
  comment = "standard public schema"
}
