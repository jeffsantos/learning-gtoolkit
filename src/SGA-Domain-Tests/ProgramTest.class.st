Class {
	#name : #ProgramTest,
	#superclass : #TestCase,
	#instVars : [
		'mockAPI'
	],
	#category : #'SGA-Domain-Tests'
}

{ #category : #running }
ProgramTest >> setUp [
	mockAPI := MockAPI createMockData
]

{ #category : #accessing }
ProgramTest >> tearDown [
	mockAPI := nil.
]

{ #category : #tests }
ProgramTest >> testCreateFromDataWithoutCohorts [
	| prog |
	prog := Program newFromData: (mockAPI programs at:'2').
	
	self assert: prog cohorts size equals: 0.
]

{ #category : #tests }
ProgramTest >> testCreateFromResource [
	| prog |
	prog := Program newFromData: (mockAPI programs at:'1').
	
	self assert: prog id equals: '1'.
	self assert: prog name equals: 'Mestrado Profissional Executivo em Gestão Empresarial'.
	self assert: prog type equals: 'MESTRADO'.
	
	self assert: prog cohorts size equals: 2.
	
]
