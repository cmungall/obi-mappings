OBO=http://purl.obolibrary.org/obo
SRC = downloads/obi.owl

downloads/bao.owl:
	robot merge -I http://www.bioassayontology.org/bao/bao_complete.owl -o $@
downloads/%.owl:
	curl -L -s $(OBO)/$*.owl > $@

mappings/obi-to-%.auto.sssom.tsv: downloads/%.owl
	rdfmatch -w conf/weights.pro -p OBI -i ontology/obi-categories.ttl  -i prefixes.ttl -i $(SRC) -i $< -o $@ match > $@
.PRECIOUS: mappings/obi-to-%.auto.sssom.tsv

mappings/obi-to-%.filtered.sssom.tsv: mappings/obi-to-%.auto.sssom.tsv
	sssom dedupe -i $< -o $@
