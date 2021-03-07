# OBI mappings

This repo contains experimental AUTOMATED mappings between OBI and other ontologies and ontology-like resources

For context see:

https://github.com/obi-ontology/obi/issues/1304

In future, this may potentially be included in [mapping commons](https://github.com/mapping-commons)



## Inputs

See [downloads](downloads)

 * obi
 * bao
 * mesh
 * wikidata TODO

## Outputs

All mappings are in [SSSOM](https://github.com/mapping-commons/SSSOM), TSV rendering

Currently we use owl:equivalentClass as predicate in the mappings, but this could be skos:exactMatch. The goal is to provide precise 1:1 mappings.

See [mappings](mappings)

## Methods

We use rdfmatch

Rules are in conf/

See Makefile

TODO: instructions on how to run with Docker

## TODO

User boomer to refine mappings
