Class {
	#name : #ProgramService,
	#superclass : #AuthService,
	#category : #'SGA-API'
}

{ #category : #abstract }
ProgramService >> initializeEndPoint [
	self serviceEndPoint: '/api/v1/Programas'
]

{ #category : #accessing }
ProgramService >> programId: id [
	| dict |
	dict := self getById: id.
	^ Program new rawData: dict
]

{ #category : #accessing }
ProgramService >> programs [
	| array |
	array := self getAll.

	^ array
		collect: [ :each | Program new rawData: each ]
]
