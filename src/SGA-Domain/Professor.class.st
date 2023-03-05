Class {
	#name : #Professor,
	#superclass : #SGAObject,
	#instVars : [
		'id',
		'name',
		'email'
	],
	#category : #'SGA-Domain'
}

{ #category : #'instance creation' }
Professor class >> newFromData: rawData [
	^ self new
		rawData: rawData;
		id: (rawData at: 'Id');
		name: (rawData at: 'Nome');
		email: (rawData at: 'Email')
]

{ #category : #accessing }
Professor >> email [
	^ email
]

{ #category : #accessing }
Professor >> email: aString [
	email := aString
]

{ #category : #accessing }
Professor >> id [
	^ id
]

{ #category : #accessing }
Professor >> id: aString [
	id := aString
]

{ #category : #accessing }
Professor >> name [
	^ name
]

{ #category : #accessing }
Professor >> name: aString [
	name := aString 
]
