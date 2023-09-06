Class {
	#name : #ProxySmaCCDartParameterNode,
	#superclass : #ProxySmaCCDartNode,
	#category : #'Famix-Dart-Importer'
}

{ #category : #accessing }
ProxySmaCCDartParameterNode >> identifier [
	|string|
	string := String new. 
	
	string := self smaccnode  declaredIdentifier declaredIdentifier idNotFunction value.
	
	^ string
]

{ #category : #accessing }
ProxySmaCCDartParameterNode >> type [
	|string|
	string := String new. 
	
	string := self smaccnode  declaredIdentifier finalConstVarOrType typeNotFunction typeIdentifier value.
	
	^ string
]
