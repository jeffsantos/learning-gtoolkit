Class {
	#name : #ProgramService,
	#superclass : #AuthService,
	#category : #'SGA-API'
}

{ #category : #accessing }
ProgramService >> initializeEndPoint [
	self serviceEndPoint: '/api/v1/Programas'
]

{ #category : #accessing }
ProgramService >> programId: id [
	| json dict |
	json := ZnClient new 
			url: self urlBase, self serviceEndPoint, '/', id printString;
			headerAt: 'Authorization' put: 'Bearer ',self token;
			get.	
			
	dict := (STON fromString: json) at: 'data'.
	
	^ Program new rawData: dict
		
]

{ #category : #accessing }
ProgramService >> programs [
	| json dictionary |
	json := ZnClient new 
			url: self urlBase, self serviceEndPoint;
			headerAt: 'Authorization' put: 'Bearer ',self token;
			get.	
			
	^ ((STON fromString: json) at: 'data')
		collect: [ :each | Program new rawData: each ]
		
]
