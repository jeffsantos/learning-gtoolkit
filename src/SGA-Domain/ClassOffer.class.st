Class {
	#name : #ClassOffer,
	#superclass : #SGAObject,
	#instVars : [
		'id',
		'language'
	],
	#category : #'SGA-Domain'
}

{ #category : #'instance creation' }
ClassOffer class >> newFromData: rawData [
	^ ClassOffer new
		rawData: rawData;
		id: (rawData at: 'Id')
]

{ #category : #accessing }
ClassOffer >> discipline [
	^ Discipline new rawData: (rawData at: 'Disciplina')
]

{ #category : #accessing }
ClassOffer >> id [
	^ id
]

{ #category : #accessing }
ClassOffer >> id: anObject [
	id := anObject
]
