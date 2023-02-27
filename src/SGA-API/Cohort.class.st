Class {
	#name : #Cohort,
	#superclass : #SGAObject,
	#instVars : [
		'id',
		'name'
	],
	#category : #'SGA-API'
}

{ #category : #'instance creation' }
Cohort class >> newFromData: rawData [
	^ self new
		rawData: rawData;
		id: (rawData at: 'Id');
		name: (rawData at: 'Nome')
]

{ #category : #accessing }
Cohort >> id [
	^ id
]

{ #category : #accessing }
Cohort >> id: anObject [
	id := anObject
]

{ #category : #accessing }
Cohort >> name [
	^ name
]

{ #category : #accessing }
Cohort >> name: anObject [
	name := anObject
]
