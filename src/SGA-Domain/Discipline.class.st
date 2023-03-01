Class {
	#name : #Discipline,
	#superclass : #SGAObject,
	#instVars : [
		'id',
		'code',
		'workload',
		'name'
	],
	#category : #'SGA-Domain'
}

{ #category : #'instance creation' }
Discipline class >> newFromData: rawData [
	^ self new
		rawData: rawData;
		id: (rawData at: 'Id');
		code: (rawData at: 'Codigo');		
		name: (rawData at: 'Nome');
		workload: (rawData at: 'CargaHoraria').
]

{ #category : #accessing }
Discipline >> code [
	^ code
]

{ #category : #accessing }
Discipline >> code: aString [
	code := aString
]

{ #category : #accessing }
Discipline >> id [
	^ id
]

{ #category : #accessing }
Discipline >> id: aString [
	id := aString
]

{ #category : #accessing }
Discipline >> name [
	^ name
]

{ #category : #accessing }
Discipline >> name: aString [
	name := aString
]

{ #category : #accessing }
Discipline >> workload [
	^ workload
]

{ #category : #accessing }
Discipline >> workload: anInteger [
	workload := anInteger
]
