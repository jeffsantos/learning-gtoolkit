Class {
	#name : #SGAInvitationListComponent,
	#superclass : #SGAScreenComponent,
	#category : #'SGA-WebComponents'
}

{ #category : #rendering }
SGAInvitationListComponent >> renderContentOn: html [
	super renderContentOn: html.
	html text: 'Convites já cadastrados aparecerão aqui.'
]
