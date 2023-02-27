Class {
	#name : #ProfessorRESTRepository,
	#superclass : #AbstractRESTRepository,
	#category : #'SGA-API'
}

{ #category : #accessing }
ProfessorRESTRepository >> initializeEndPoint [
	self serviceEndPoint: '/api/v1/Professores'
]

{ #category : #accessing }
ProfessorRESTRepository >> professorId: id [
	| dict |
	dict := self getById: id.
	^ Professor newFromData: dict
]

{ #category : #accessing }
ProfessorRESTRepository >> professors [
	| array |
	array := self getAll.

	^ array
		collect: [ :each | Professor newFromData: each ]
]
