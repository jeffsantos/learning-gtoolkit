Class {
	#name : #AbstractRESTRepository,
	#superclass : #Object,
	#instVars : [
		'urlBase',
		'authEndPoint',
		'serviceEndPoint',
		'authRawData'
	],
	#category : #'SGA-Domain'
}

{ #category : #'instance creation' }
AbstractRESTRepository class >> createRESTRepository [
	^ self new
			urlBase: self defaultURL;
			authEndPoint: 'Auth';
			initializeEndPoint;
			authenticate.

]

{ #category : #'default values' }
AbstractRESTRepository class >> defaultURL [
	| stream env url prefix version envKey |
	
	stream := 'sga-settings.json' asFileReference readStream.
	env := STON fromStream: stream.
	
	envKey := env at: 'current'.
	
	url := (env at: envKey) at: 'url'.
	prefix := (env at: envKey) at: 'prefix'.
	version := (env at: envKey) at: 'version'.
	
	(prefix ~= '') ifTrue: [ url := url,'/',prefix ].
	
	(version ~= '') ifTrue: [ url := url,'/',version ].

	^ url,'/'
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
