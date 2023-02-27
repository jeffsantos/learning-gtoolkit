Class {
	#name : #ProgramRESTRepository,
	#superclass : #AbstractRESTRepository,
	#category : #'SGA-Domain'
}

{ #category : #abstract }
ProgramRESTRepository >> initializeEndPoint [
	self serviceEndPoint: '/api/v1/Programas'
]

{ #category : #accessing }
ProgramRESTRepository >> programId: id [
	| dict |
	dict := self getById: id.
	^ Program new rawData: dict
]

{ #category : #accessing }
ProgramRESTRepository >> programs [
	| array |
	array := self getAll.

	^ array
		collect: [ :each | Program new rawData: each ]
]
