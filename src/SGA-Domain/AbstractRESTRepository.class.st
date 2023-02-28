Class {
	#name : #AbstractRESTRepository,
	#superclass : #Object,
	#instVars : [
		'urlBase',
		'authEndPoint',
		'serviceEndPoint',
		'authRawData',
		'rawData'
	],
	#category : #'SGA-Domain'
}

{ #category : #'instance creation' }
AbstractRESTRepository class >> createRESTRepository [
	^ self new
			urlBase: self defaultURL;
			authEndPoint: '/api/v1/Auth';
			initializeEndPoint;
			authenticate.

]

{ #category : #'default values' }
AbstractRESTRepository class >> defaultURL [
	| localUrl desenvUrl |
	localUrl := 'http://localhost:1654/ebape/gestaoacad'.
	desenvUrl := 'https://www-d.fgv.br/EBAPE/GestaoAcad'.

	^ localUrl
]

{ #category : #accessing }
AbstractRESTRepository >> authEndPoint [
	^ authEndPoint
]

{ #category : #accessing }
AbstractRESTRepository >> authEndPoint: anObject [
	authEndPoint := anObject
]

{ #category : #accessing }
AbstractRESTRepository >> authRawData: dictionary [
	authRawData := dictionary
]

{ #category : #authentication }
AbstractRESTRepository >> authenticate [
	| json dictionary |
	json := ZnClient new
			url: self urlBase, self authEndPoint;
			formAt: 'login' put: 'sga.planejamento';
			formAt: 'senha' put: '123';
			post.
			
	dictionary := STON fromString: json.
	
	self authRawData: dictionary.
]

{ #category : #services }
AbstractRESTRepository >> getAll [
	| json |
	json := ZnClient new
			url: self urlBase , self serviceEndPoint;
			headerAt: 'Authorization' put: 'Bearer ' , self token;
			get.
	^ (STON fromString: json) at: 'data'
]

{ #category : #accessing }
AbstractRESTRepository >> getById: id [
	| json |
	json := ZnClient new
			url: self urlBase , self serviceEndPoint , '/' , id printString;
			headerAt: 'Authorization' put: 'Bearer ' , self token;
			get.
	^ (STON fromString: json) at: 'data'
]

{ #category : #abstract }
AbstractRESTRepository >> initializeEndPoint [
	self subclassResponsibility
]

{ #category : #accessing }
AbstractRESTRepository >> rawData [
	^ rawData
]

{ #category : #accessing }
AbstractRESTRepository >> rawData: anObject [
	rawData := anObject
]

{ #category : #accessing }
AbstractRESTRepository >> serviceEndPoint [
	^ serviceEndPoint
]

{ #category : #accessing }
AbstractRESTRepository >> serviceEndPoint: anObject [
	serviceEndPoint := anObject
]

{ #category : #accessing }
AbstractRESTRepository >> token [
	^ (authRawData at: 'data') at: 'token'
]

{ #category : #accessing }
AbstractRESTRepository >> tokenValidity [
	^ (authRawData at: 'data') at: 'validoAte'
]

{ #category : #accessing }
AbstractRESTRepository >> urlBase [
	^ urlBase
]

{ #category : #accessing }
AbstractRESTRepository >> urlBase: anObject [
	urlBase := anObject
]
