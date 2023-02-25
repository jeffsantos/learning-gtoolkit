Class {
	#name : #DisciplineService,
	#superclass : #AuthService,
	#category : #'SGA-API'
}

{ #category : #accessing }
DisciplineService >> disciplineId: id [
	| dict |
	dict := self getById: id.
	^ Discipline new rawData: dict
		
]

{ #category : #accessing }
DisciplineService >> disciplines [
	| array |
	array := self getAll.
			
	^ array
		collect: [ :each | Discipline new rawData: each ]
		
]

{ #category : #abstract }
DisciplineService >> initializeEndPoint [
	self serviceEndPoint: '/api/v1/Disciplinas'
]
