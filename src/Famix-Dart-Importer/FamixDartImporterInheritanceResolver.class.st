"
I represent a resolver for inheritance relations.
The importer stack me during the first import phase, then call resolve on myself.
I return true if I achieve the resolve step, false instead
"
Class {
	#name : #FamixDartImporterInheritanceResolver,
	#superclass : #FamixDartImporterResolver,
	#instVars : [
		'subclass',
		'context',
		'importer'
	],
	#category : #'Famix-Dart-Importer'
}

{ #category : #accessing }
FamixDartImporterInheritanceResolver >> context [

	^ context
]

{ #category : #accessing }
FamixDartImporterInheritanceResolver >> context: anObject [

	context := anObject
]

{ #category : #accessing }
FamixDartImporterInheritanceResolver >> importer [

	^ importer
]

{ #category : #accessing }
FamixDartImporterInheritanceResolver >> importer: anObject [

	importer := anObject
]

{ #category : #accessing }
FamixDartImporterInheritanceResolver >> resolve [

	(self importer model allWithType: FamixDartClass) asOrderedCollection
		detect: [ :c | c name = self context typeIdentifier value ]
		ifOne: [ :famixEntity |
			| inheritance |
			inheritance := self importer model newInheritance.
			inheritance superclass: famixEntity.
			inheritance subclass: self subclass.
			^ true ]
		ifNone: [ ^ false ]
]

{ #category : #accessing }
FamixDartImporterInheritanceResolver >> subclass [

	^ subclass
]

{ #category : #accessing }
FamixDartImporterInheritanceResolver >> subclass: anObject [

	subclass := anObject
]
