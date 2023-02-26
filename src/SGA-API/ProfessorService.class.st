Class {
	#name : #ProfessorService,
	#superclass : #AuthService,
	#category : #'SGA-API'
}

{ #category : #accessing }
ProfessorService >> initializeEndPoint [
	self serviceEndPoint: '/api/v1/Professores'
]

{ #category : #accessing }
ProfessorService >> professorId: id [
	| dict |
	dict := self getById: id.
	^ Professor new rawData: dict
]

{ #category : #accessing }
ProfessorService >> professors [
	| array |
	array := self getAll.

	^ array
		collect: [ :each | Professor new rawData: each ]
]
