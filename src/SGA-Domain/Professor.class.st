Class {
	#name : #Professor,
	#superclass : #SGAObject,
	#instVars : [
		'id',
		'name'
	],
	#category : #'SGA-Domain'
}

{ #category : #'instance creation' }
Professor class >> newFromData: rawData [
	^ self new
		rawData: rawData;
		id: (rawData at: 'Id');
		name: (rawData at: 'Nome')
]

{ #category : #accessing }
Professor >> id [
	^ id
]

{ #category : #accessing }
Professor >> id: anObject [
	id := anObject
]

{ #category : #accessing }
Professor >> name [
	^ name
]

{ #category : #accessing }
Professor >> name: aString [
	name := aString 
]
