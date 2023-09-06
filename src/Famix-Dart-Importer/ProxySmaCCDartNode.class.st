Class {
	#name : #ProxySmaCCDartNode,
	#superclass : #Object,
	#instVars : [
		'smaccnode'
	],
	#category : #'Famix-Dart-Importer'
}

{ #category : #'instance creation' }
ProxySmaCCDartNode class >> fromNode: aSmaccNode [ 
	|proxy|
	proxy := self new. 
	proxy smaccnode: aSmaccNode.
	^ proxy
]

{ #category : #accessing }
ProxySmaCCDartNode >> smaccnode [

	^ smaccnode
]

{ #category : #accessing }
ProxySmaCCDartNode >> smaccnode: anObject [

	smaccnode := anObject
]
