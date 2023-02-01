Class {
	#name : #GithubOrganization,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'JBS-Tutorials'
}

{ #category : #accessing }
GithubOrganization >> gtPropertiesFor: aView [
	<gtView>
	^ aView forward
		title: 'Properties';
		priority: 10;
		object: [ rawData ];
		view: #gtItemsFor:
		
]

{ #category : #accessing }
GithubOrganization >> gtReposFor: aView [
	<gtView>
	^ aView list
		title: 'Repositories';
		priority: 10;
		items: [ self repos];
		itemText: [ :each | each fullName ]
]

{ #category : #accessing }
GithubOrganization >> rawData: dictionary [
	rawData := dictionary
]

{ #category : #accessing }
GithubOrganization >> repos [
	| json url |
	url := rawData at: 'repos_url'.
	json := ZnClient new get: url.
	^ (STON fromString: json)
		collect: [ :each | GithubRepository new rawData: each ]
]
