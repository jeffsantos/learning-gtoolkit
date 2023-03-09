Class {
	#name : #SGATestResource,
	#superclass : #TestResource,
	#instVars : [
		'mockAPI'
	],
	#category : #'SGA-Domain-Tests'
}

{ #category : #accessing }
SGATestResource >> mockAPI [
	^ mockAPI
]

{ #category : #accessing }
SGATestResource >> mockAPI: aMockAPI [
	mockAPI := aMockAPI
]

{ #category : #accessing }
SGATestResource >> setUp [
	mockAPI := MockAPI createMockData
]

{ #category : #accessing }
SGATestResource >> tearDown [
]
