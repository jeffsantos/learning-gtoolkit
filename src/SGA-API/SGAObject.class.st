Class {
	#name : #SGAObject,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'SGA-API'
}

{ #category : #accessing }
SGAObject >> gtPropertiesFor: aView [
	<gtView>
	^ aView forward
		title: 'Properties';
		priority: 10;
		object: [ rawData ];
		view: #gtItemsFor:
]

{ #category : #accessing }
SGAObject >> rawData: dict [
	rawData := dict 
]
