Class {
	#name : #AuthService,
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
AuthService class >> createService [
	^ self new
			urlBase: 'https://www-d.fgv.br/EBAPE/GestaoAcad';
			authEndPoint: '/api/v1/Auth';
			initializeEndPoint;
			authenticate.

]

{ #category : #accessing }
AuthService >> authEndPoint [
	^ authEndPoint
]

{ #category : #accessing }
AuthService >> authEndPoint: anObject [
	authEndPoint := anObject
]

{ #category : #accessing }
AuthService >> authRawData: dictionary [
	authRawData := dictionary
]

{ #category : #accessing }
AuthService >> authenticate [
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
AuthService >> initializeEndPoint [
	self subclassResponsibility
]

{ #category : #accessing }
AuthService >> rawData [
	^ rawData
]

{ #category : #accessing }
AuthService >> rawData: anObject [
	rawData := anObject
]

{ #category : #accessing }
AuthService >> serviceEndPoint [
	^ serviceEndPoint
]

{ #category : #accessing }
AuthService >> serviceEndPoint: anObject [
	serviceEndPoint := anObject
]

{ #category : #accessing }
AuthService >> token [
	^ (authRawData at: 'data') at: 'token'
]

{ #category : #accessing }
AuthService >> tokenValidity [
	^ (authRawData at: 'data') at: 'validoAte'
]

{ #category : #accessing }
AuthService >> urlBase [
	^ urlBase
]

{ #category : #accessing }
AuthService >> urlBase: anObject [
	urlBase := anObject
]
