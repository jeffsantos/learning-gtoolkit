Class {
	#name : #Professor,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'SGA-API'
}

{ #category : #accessing }
Professor >> name [
	^ rawData at: 'Nome'
]

{ #category : #accessing }
Professor >> rawData: dict [
	rawData := dict 
]
