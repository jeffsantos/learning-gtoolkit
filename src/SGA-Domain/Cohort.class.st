Class {
	#name : #Cohort,
	#superclass : #SGAObject,
	#instVars : [
		'id',
		'name'
	],
	#category : #'SGA-Domain'
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
Cohort >> id: aString [
	id := aString
]

{ #category : #accessing }
Cohort >> name [
	^ name
]

{ #category : #accessing }
Cohort >> name: aString [
	name := aString
]
