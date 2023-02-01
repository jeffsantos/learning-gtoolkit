Class {
	#name : #Discipline,
	#superclass : #AuthObject,
	#category : #'SGA-API'
}

{ #category : #accessing }
Discipline >> getAllDisciplines [
	| json dictionary |
	json := ZnClient new 
			url: self urlBase, self serviceEndPoint;
			headerAt: 'Authorization' put: 'Bearer ',self token;
			get.	
			
	dictionary := STON fromString: json.
	
	^ dictionary.
]

{ #category : #accessing }
Discipline >> initializeEndPoint [
	self serviceEndPoint: '/api/v1/Disciplinas'
]
