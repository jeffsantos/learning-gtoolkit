Class {
	#name : #GithubRepository,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'JBS-Tutorials'
}

{ #category : #accessing }
GithubRepository >> fullName [
	^ rawData at: 'full_name'
]

{ #category : #accessing }
GithubRepository >> rawData: dict [
	rawData := dict 
]
