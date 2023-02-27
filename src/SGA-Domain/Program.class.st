Class {
	#name : #Program,
	#superclass : #SGAObject,
	#instVars : [
		'id',
		'name'
	],
	#category : #'SGA-Domain'
}

{ #category : #'instance creation' }
Program class >> newFromData: rawData [
	^ self new
		rawData: rawData;
		id: (rawData at: 'Id');
		name: (rawData at: 'Nome')
]

{ #category : #accessing }
Program >> cohorts [
	^ (rawData at: 'Turmas') 
		collect: [ :each | Cohort new rawData: each ]
]

{ #category : #accessing }
Program >> coordinator [
	^ Professor new rawData: (rawData at: 'Coordenador')
]

{ #category : #accessing }
Program >> id [
	^ id
]

{ #category : #accessing }
Program >> id: anObject [
	id := anObject
]

{ #category : #accessing }
Program >> name [
	^ name
]

{ #category : #accessing }
Program >> name: anObject [
	name := anObject
]
