Class {
	#name : #Program,
	#superclass : #SGAObject,
	#instVars : [
		'id',
		'name',
		'type',
		'cohorts'
	],
	#category : #'SGA-Domain'
}

{ #category : #'instance creation' }
Program class >> newFromData: rawData [
	| program |
	program := self new
					rawData: rawData;
					id: (rawData at: 'Id');
					name: (rawData at: 'Nome');
					type: (rawData at: 'Curso').
					
	program cohorts addAll: ((rawData at: 'Turmas') 
					collect: [ :each | Cohort newFromData: each ]).
						
	^ program
	
]

{ #category : #accessing }
Program >> cohorts [
	^ cohorts ifNil: [ cohorts := OrderedCollection new ]
]

{ #category : #accessing }
Program >> id [
	^ id
]

{ #category : #accessing }
Program >> id: aString [
	id := aString
]

{ #category : #accessing }
Program >> name [
	^ name
]

{ #category : #accessing }
Program >> name: aString [
	name := aString
]

{ #category : #accessing }
Program >> type [
	^ type
]

{ #category : #accessing }
Program >> type: aString [
	type := aString
]
