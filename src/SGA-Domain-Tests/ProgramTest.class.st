Class {
	#name : #ProgramTest,
	#superclass : #TestCase,
	#category : #'SGA-Domain-Tests'
}

{ #category : #tests }
ProgramTest >> testCreateFromData [
	| dict map |
	dict := {'Id' -> '1' . 
			 'Nome' -> 'Mestrado Profissional em Administração Pública' } asDictionary.
	
	map := Program newFromData: dict.
	
	self assert: map id equals: '1'.
	self assert: map name equals: 'Mestrado Profissional em Administração Pública'.
	
]
