Class {
	#name : #ProxySmaCCDartParametersListNode,
	#superclass : #ProxySmaCCDartNode,
	#category : #'Famix-Dart-Importer'
}

{ #category : #accessing }
ProxySmaCCDartParametersListNode >> allParameters [
	|parms|
	parms := OrderedCollection new. 
	(self smaccnode className = #DartEmptyFormalParameterListNode) ifFalse: [ 
		
		parms add: self smaccnode parameter parameter.
	smaccnode nextParameters do: [ :p | parms add: p parameter ].   ].

	

	^ parms 
]
