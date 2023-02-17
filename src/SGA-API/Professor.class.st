Class {
	#name : #Professor,
	#superclass : #SGAObject,
	#category : #'SGA-API'
}

{ #category : #accessing }
Professor >> name [
	^ rawData at: 'Nome'
]
