Class {
	#name : #ProxySmaCCDartFunctionNode,
	#superclass : #ProxySmaCCDartNode,
	#category : #'Famix-Dart-Importer'
}

{ #category : #'as yet unclassified' }
ProxySmaCCDartFunctionNode >> functionIdentifier [
	^ self smaccnode signature identifierNotFUNCTION value
]

{ #category : #accessing }
ProxySmaCCDartFunctionNode >> parameters [
	|params proxyParm|
	params := OrderedCollection new. 
	

	proxyParm := ProxySmaCCDartParametersListNode fromNode: self smaccnode signature formalParameterPart formalParameterList .

	proxyParm allParameters do: [ :p | params add: (ProxySmaCCDartParameterNode fromNode: p) ]. 
	
^ params 
]

{ #category : #'as yet unclassified' }
ProxySmaCCDartFunctionNode >> returnedType [
	|type|
	type := self smaccnode signature type.
	
	type typeNotFunction class == SmaCCToken ifTrue: [ 
		 ^ type typeNotFunction value
			 ] ifFalse: [
			^ type typeNotFunction typeIdentifier value.
			].

]

{ #category : #accessing }
ProxySmaCCDartFunctionNode >> signature [ 
	|sign parms|
	sign := String new. 
	sign := self returnedType, ' ' , self functionIdentifier. 
	
	parms := self parameters.
	parms isEmpty ifTrue: [ sign := sign , '()' ] ifFalse: [ 
	self parameters do: [ :p |
		sign := sign , p type , ' ', p identifier.  ]
	].
	
	^ sign


"^ (self smaccnode signature topParent
			              completeSource
			              copyFrom:
			              self smaccnode signature startPosition
			              to:
			              self smaccnode signature stopPosition)
			             asString , ')'."
]
