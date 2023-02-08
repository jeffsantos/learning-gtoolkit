Class {
	#name : #Program,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'SGA-API'
}

{ #category : #accessing }
Program >> cohorts [
	^ (rawData at: 'Turmas') 
		collect: [ :each | Cohort new rawData: each ]
]

{ #category : #accessing }
Program >> rawData: dict [
	rawData := dict 
]
