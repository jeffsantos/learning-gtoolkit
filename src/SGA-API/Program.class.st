Class {
	#name : #Program,
	#superclass : #SGAObject,
	#category : #'SGA-API'
}

{ #category : #accessing }
Program >> cohorts [
	^ (rawData at: 'Turmas') 
		collect: [ :each | Cohort new rawData: each ]
]

{ #category : #accessing }
Program >> coordinator [
	^ Professor new rawData: (rawData at: 'Coordenador')
]
