Class {
	#name : #DisciplineService,
	#superclass : #AuthObject,
	#category : #'SGA-API'
}

{ #category : #accessing }
DisciplineService >> getAllDisciplines [
	| json dictionary |
	json := ZnClient new 
			url: self urlBase, self serviceEndPoint;
			headerAt: 'Authorization' put: 'Bearer ',self token;
			get.	
			
	dictionary := STON fromString: json.
	
	^ dictionary.
]

{ #category : #accessing }
DisciplineService >> initializeEndPoint [
	self serviceEndPoint: '/api/v1/Disciplinas'
]
