Class {
	#name : #AuthObject,
	#superclass : #Object,
	#instVars : [
		'urlBase',
		'authEndPoint',
		'serviceEndPoint',
		'authRawData',
		'rawData'
	],
	#category : #'SGA-API'
}

{ #category : #accessing }
AuthObject class >> createService [
	^ self new
			urlBase: 'https://www-d.fgv.br/EBAPE/GestaoAcad';
			authEndPoint: '/api/v1/Auth';
			initializeEndPoint;
			authenticate.

]

{ #category : #accessing }
AuthObject >> authEndPoint [
	^ authEndPoint
]

{ #category : #accessing }
AuthObject >> authEndPoint: anObject [
	authEndPoint := anObject
]

{ #category : #accessing }
AuthObject >> authRawData: dictionary [
	authRawData := dictionary
]

{ #category : #accessing }
AuthObject >> authenticate [
	| json dictionary |
	json := ZnClient new
			url: self urlBase, self authEndPoint;
			formAt: 'login' put: 'sga.planejamento';
			formAt: 'senha' put: '123';
			post.
			
	dictionary := STON fromString: json.
	
	self authRawData: dictionary.
]

{ #category : #accessing }
AuthObject >> initializeEndPoint [
	self subclassResponsibility
]

{ #category : #accessing }
AuthObject >> rawData [
	^ rawData
]

{ #category : #accessing }
AuthObject >> rawData: anObject [
	rawData := anObject
]

{ #category : #accessing }
AuthObject >> serviceEndPoint [
	^ serviceEndPoint
]

{ #category : #accessing }
AuthObject >> serviceEndPoint: anObject [
	serviceEndPoint := anObject
]

{ #category : #accessing }
AuthObject >> token [
	^ (authRawData at: 'data') at: 'token'
]

{ #category : #accessing }
AuthObject >> tokenValidity [
	^ (authRawData at: 'data') at: 'validoAte'
]

{ #category : #accessing }
AuthObject >> urlBase [
	^ urlBase
]

{ #category : #accessing }
AuthObject >> urlBase: anObject [
	urlBase := anObject
]
