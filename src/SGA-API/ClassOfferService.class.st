Class {
	#name : #ClassOfferService,
	#superclass : #AuthService,
	#category : #'SGA-API'
}

{ #category : #accessing }
ClassOfferService >> classOfferId: id [
	| dict |
	dict := self getById: id.
	^ ClassOffer new rawData: dict
]

{ #category : #accessing }
ClassOfferService >> classOffers [
	| array |
	array := self getAll.
			
	^ array
		collect: [ :each | ClassOffer new rawData: each ]
]

{ #category : #abstract }
ClassOfferService >> initializeEndPoint [
	self serviceEndPoint: '/api/v1/Classes'
]
