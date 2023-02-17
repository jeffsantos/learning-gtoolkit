Class {
	#name : #Discipline,
	#superclass : #SGAObject,
	#category : #'SGA-API'
}

{ #category : #accessing }
Discipline >> code [
	^ rawData at: 'Codigo'
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
Discipline >> workload [
	^ rawData at: 'CargaHoraria'
]
