Class {
	#name : #DisciplineService,
	#superclass : #AuthService,
	#category : #'SGA-API'
}

{ #category : #accessing }
DisciplineService >> getAllDisciplines [
	| json dictionary |
	json := ZnClient new 
			url: self urlBase, self serviceEndPoint;
			headerAt: 'Authorization' put: 'Bearer ',self token;
			get.	
			
	^ ((STON fromString: json) at: 'data')
		collect: [ :each | Discipline new rawData: each ]
		
]

{ #category : #accessing }
DisciplineService >> getDiscipline: id [
	| json dict |
	json := ZnClient new 
			url: self urlBase, self serviceEndPoint, '/', id printString;
			headerAt: 'Authorization' put: 'Bearer ',self token;
			get.	
			
	dict := (STON fromString: json) at: 'data'.
	
	^ Discipline new rawData: dict
		
]

{ #category : #accessing }
DisciplineService >> initializeEndPoint [
	self serviceEndPoint: '/api/v1/Disciplinas'
]
