Class {
	#name : #MockAPIServer,
	#superclass : #TLWebserver,
	#category : #'SGA-Domain-Tests'
}

{ #category : #action }
MockAPIServer class >> rebuildRoutes [
	
	self defaultServer initializeTeapotDefaultOptions.
	self defaultServer createTeapotDefaultRoutes.	
	
]

{ #category : #defaults }
MockAPIServer >> createTeapotDefaultRoutes [
	| mockData data |
	mockData := MockAPI createWithMockData.
	
	data := Dictionary new.
		
	teapot stop.
	teapot removeAllDynamicRoutes.
	
	teapot
		GET: '/Programas' ->  [ data at: 'data' put: (mockData programs); yourself ];
		GET: '/Programas/<id:IsInteger>' -> [ :request | data at: 'data' put: (mockData programId: (request at: #id) asString); yourself ];
		GET: '/Professores' -> [ data at: 'data' put: mockData professors; yourself ];
		GET: '/Professores/<id:IsInteger>' -> [ :request |  data at: 'data' put: (mockData professorId: (request at: #id) asString); yourself ];
		GET: '/Disciplinas' -> [ data at: 'data' put: mockData disciplines; yourself ];
		GET: '/Disciplinas/<id:IsInteger>' -> [ :request |  data at: 'data' put: (mockData disciplineId: (request at: #id) asString); yourself ];
		GET: '/Classes' -> [ data at: 'data' put: mockData classOffers; yourself ];
		GET: '/Classes/<id>' -> [ :request |  data at: 'data' put: (mockData classOfferId: (request at: #id) asString); yourself ];
		POST: '/Auth' -> [ :request | | login |
	
									login := { 'login' -> (request at: #login)..
											   'senha' -> (request at: #senha) } asDictionary.
									data := { 'data' -> { 'token' -> '4302917e-c0bd-4f02-a15b-b7cf42ad6f5c' } asDictionary} asDictionary].
]

{ #category : #initialization }
MockAPIServer >> initializeTeapotDefaultOptions [

	teapot initializeOptions: { #defaultOutput -> #json. 
								   #port -> 8282.
								   } asDictionary.
]
