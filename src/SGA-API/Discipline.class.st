Class {
	#name : #Discipline,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'SGA-API'
}

{ #category : #accessing }
Discipline >> code [
	^ rawData at: 'Codigo'
]

{ #category : #accessing }
Discipline >> gtPropertiesFor: aView [
	<gtView>
	^ aView forward
		title: 'Properties';
		priority: 10;
		object: [ rawData ];
		view: #gtItemsFor:
]

{ #category : #accessing }
Discipline >> id [
	^ rawData at: 'Id'
]

{ #category : #accessing }
Discipline >> name [
	^ rawData at: 'Nome'
]

{ #category : #accessing }
Discipline >> rawData: each [
	rawData := each 
]

{ #category : #accessing }
Discipline >> workload [
	^ rawData at: 'CargaHoraria'
]
