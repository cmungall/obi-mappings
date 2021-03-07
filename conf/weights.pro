
% same category boosts probability
weight(1.0, [predicate_id='owl:equivalentClass', subject_category=X, object_category=X]).

% specific to OBI-BAO
weight(2.0, [predicate_id='owl:equivalentClass', subject_category='Device', object_category='assay method component']).
weight(2.0, [predicate_id='owl:equivalentClass', subject_category='Device', object_category='assay bioassay component']).
weight(2.0, [predicate_id='owl:equivalentClass', subject_category='Assay', object_category='assay method component']).
weight(2.0, [predicate_id='owl:equivalentClass', subject_category='Plan', object_category='assay method component']).
weight(1.0, [predicate_id='owl:equivalentClass', subject_category='SequenceFeature', object_category='assay biology component']).

% specific to OBI-MESH
weight(-1.0, [predicate_id='owl:equivalentClass', subject_category='Device', object_category='Investigative Techniques']).
weight(2.0, [predicate_id='owl:equivalentClass', subject_category='Device', object_category='Equipment and Supplies']).
weight(2.0, [predicate_id='owl:equivalentClass', subject_category='PlannedProcess', object_category='Investigative Techniques']).

% same source less likely to be equivalent
weight(-3, [predicate_id='owl:equivalentClass', subject_source=X, object_source=X]).

% xrefs
weight(1.0, [predicate_id='owl:equivalentClass', subject_match_field='oio:hasDbXref', object_match_field='oio:hasDbXref']).

% combos of label/exact
%weight(2.5, [predicate_id='owl:equivalentClass', subject_match_field='rdfs:label', object_match_field='rdfs:label']).
%weight(2.0, [predicate_id='owl:equivalentClass', subject_match_field='oio:hasExactSynonym', object_match_field='rdfs:label']).
%weight(2.0, [predicate_id='owl:equivalentClass', subject_match_field='oio:hasExactSynonym', object_match_field='oio:hasExactSynonym']).
%weight(2.0, [predicate_id='owl:equivalentClass', subject_match_field='rdfs:label', object_match_field='oio:hasExactSynonym']).

weight(2, [predicate_id='owl:equivalentClass', any_match_field='dc:identifier']).
weight(2, [predicate_id='owl:equivalentClass', any_match_field='schema:url']).

weight(1.2, [predicate_id='owl:equivalentClass', any_match_field='rdfs:label']).
weight(1.0, [predicate_id='owl:equivalentClass', any_match_field='oio:hasExactSynonym']).
weight(1.0, [predicate_id='owl:equivalentClass', any_match_field='skos:exactMatch']).

weight(-1, [predicate_id='owl:equivalentClass', any_match_field='oio:hasNarrowSynonym']).
weight(-1, [predicate_id='owl:equivalentClass', any_match_field='oio:hasBroadSynonym']).

% lexical is lower, stemmming even lower
weight(-3.0, [predicate_id='owl:equivalentClass', match_type=['Lexical','Stemming']]).
weight(-0.5, [predicate_id='owl:equivalentClass', match_type=['Lexical']]).

weight(-1, [match_string=S]) :-  atom_length(S,3).
weight(-2, [match_string=S]) :-  atom_length(S,2).
weight(-3, [match_string=S]) :-  atom_length(S,1).
weight(-99, [match_string=S]) :-  atom_length(S,0).


