Class {
	#name : #ClassOfferRESTRepository,
	#superclass : #AbstractRESTRepository,
	#category : #'SGA-Domain'
}

{ #category : #accessing }
ClassOfferRESTRepository >> classOfferId: id [
	| dict |
	dict := self getById: id.
	^ ClassOffer new rawData: dict
]

{ #category : #accessing }
ClassOfferRESTRepository >> classOffers [
	| array |
	array := self getAll.
			
	^ array
		collect: [ :each | ClassOffer new rawData: each ]
]

{ #category : #abstract }
ClassOfferRESTRepository >> initializeEndPoint [
	self serviceEndPoint: '/api/v1/Classes'
]
