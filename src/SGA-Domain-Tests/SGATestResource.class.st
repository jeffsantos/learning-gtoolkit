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

{ #category : #running }
SGATestResource >> setUp [
	mockAPI := MockAPI createWithMockData
]

{ #category : #running }
SGATestResource >> tearDown [
]
