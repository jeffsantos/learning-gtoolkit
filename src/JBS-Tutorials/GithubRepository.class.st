Class {
	#name : #GithubRepository,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'JBS-Tutorials'
}

{ #category : #accessing }
GithubRepository >> authRawData: dict [
	rawData := dict 
]

{ #category : #accessing }
GithubRepository >> fullName [
	^ rawData at: 'full_name'
]
