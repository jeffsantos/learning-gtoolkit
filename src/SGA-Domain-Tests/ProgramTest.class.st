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

{ #category : #tests }
ProgramTest >> testCreateFromData [
	| dict map |
	dict := {'id' -> '1' . 
			 'nome' -> 'Mestrado Profissional em Administração Pública' .
			 'curso' -> 'MESTRADO' 
			 } asDictionary.
	
	map := Program newFromData: dict.
	
	self assert: map id equals: '1'.
	self assert: map name equals: 'Mestrado Profissional em Administração Pública'.
	self assert: map type equals: 'MESTRADO'.
	
]

{ #category : #tests }
ProgramTest >> testCreateFromDataWithoutCohorts [
	self assert: 1 equals: 0.
]

{ #category : #tests }
ProgramTest >> testCreateFromResource [
	| map |
	map := Program newFromData: (mockAPI programs at:'1').
	
	self assert: map id equals: '1'.
	self assert: map name equals: 'Mestrado Profissional em Administração Pública'.
	self assert: map type equals: 'MESTRADO'.
]
