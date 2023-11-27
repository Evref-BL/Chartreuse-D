Class {
	#name : #FamixDartJSONImporter,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'Famix-Dart-Importer'
}

{ #category : #api }
FamixDartJSONImporter >> importFile: jsonFileName [

	self visitJsonMap:
		(jsonFileName asFileReference readStreamDo: [ :stream | 
			 NeoJSONReader fromString: stream contents ]).
	^model
]

{ #category : #initialization }
FamixDartJSONImporter >> initialize [

	super initialize.

	model := FamixDartModel new.
]

{ #category : #accessing }
FamixDartJSONImporter >> model [

	^ model
]

{ #category : #accessing }
FamixDartJSONImporter >> model: anObject [

	model := anObject
]

{ #category : #visiting }
FamixDartJSONImporter >> visitCompilationUnit: aCompilationUnitNode [

	self visitJsonElement: (aCompilationUnitNode at: #methods)
]

{ #category : #'visiting reflectivity' }
FamixDartJSONImporter >> visitJsonArray: aCollection [
	^aCollection collect: [ :each | self visitJsonElement: each ]
]

{ #category : #'visiting reflectivity' }
FamixDartJSONImporter >> visitJsonElement: aNode [
	aNode ifNil: [ ^nil ].
	aNode isDictionary  ifTrue: [ ^self visitJsonMap: aNode ].
	aNode isArray  ifTrue: [ ^self visitJsonArray: aNode ].
]

{ #category : #'visiting reflectivity' }
FamixDartJSONImporter >> visitJsonMap: jsonDictionary [

        | key |
    key := jsonDictionary at: 'tag'.
    ^ self visitKey: key value: jsonDictionary
]

{ #category : #'visiting reflectivity' }
FamixDartJSONImporter >> visitKey: key value: aNode [
    | selector |
    selector := ('visit' , key capitalized , ':') asSymbol.
    ^self perform: selector with: aNode
]

{ #category : #visiting }
FamixDartJSONImporter >> visitMethodDeclation: aMethodDeclarationNode [

	| entity |
	entity := FamixDartMethod new.
	model add: entity.
	entity name: (aMethodDeclarationNode at: 'name').
	entity parameters:
		(self visitJsonElement: (aMethodDeclarationNode at: #parameters)).
	^ entity
]

{ #category : #visiting }
FamixDartJSONImporter >> visitParameterDeclation: aParameterDeclarationNode [

	| entity |
	entity := FamixDartParameter new.
	model add: entity.
	entity name: (aParameterDeclarationNode at: 'name').
	^entity
]
