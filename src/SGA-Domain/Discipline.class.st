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
Discipline >> code: anObject [
	code := anObject
]

{ #category : #accessing }
Discipline >> id [
	^ id
]

{ #category : #accessing }
Discipline >> id: anObject [
	id := anObject
]

{ #category : #accessing }
Discipline >> name [
	^ name
]

{ #category : #accessing }
Discipline >> name: anObject [
	name := anObject
]

{ #category : #accessing }
Discipline >> workload [
	^ workload
]

{ #category : #accessing }
Discipline >> workload: anObject [
	workload := anObject
]
