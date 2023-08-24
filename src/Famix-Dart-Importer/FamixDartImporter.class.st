Class {
	#name : #FamixDartImporter,
	#superclass : #Object,
	#instVars : [
		'model',
		'parser',
		'visitor',
		'stackFamixEntities'
	],
	#category : #'Famix-Dart-Importer'
}

{ #category : #'private - factory' }
FamixDartImporter >> ensureAttributeNamed: aString [

		^ self model add: (FamixDartAttribut new
			   name: aString;
			   yourself)
]

{ #category : #'private - factory' }
FamixDartImporter >> ensureClassNamed: aString [

	^ self model add: (FamixDartClass new
			   name: aString;
			   yourself)
	
]

{ #category : #'private - factory' }
FamixDartImporter >> ensureMethodNamed: aString [

	^ self model add: (FamixDartMethod new
			   name: aString;
			   yourself)
]

{ #category : #importer }
FamixDartImporter >> importFromDartAST: aDartLibraryDefinitionNode [

	aDartLibraryDefinitionNode acceptVisitor: visitor. 
]

{ #category : #importer }
FamixDartImporter >> importFromString: aString [ 
	self importFromDartAST: (self parser parse: aString). 
]

{ #category : #importer }
FamixDartImporter >> importProject: aFileReference [
	"I parse all dart files under a root folder and import them"

	(aFileReference allChildrenMatching: '*.dart') do: [
		:dartFileReference |
		self importFromDartAST:
			(self parser parse: dartFileReference contents) ]
]

{ #category : #initialization }
FamixDartImporter >> initialize [

	super initialize.
	parser := DartParser.
	visitor := FamixDartImporterVisitor new
		           importer: self;
		           yourself.
	stackFamixEntities := Stack new. 
]

{ #category : #accessing }
FamixDartImporter >> model [
	^ model
]

{ #category : #accessing }
FamixDartImporter >> model: aFamixDartModel [ 
	model := aFamixDartModel
]

{ #category : #accessing }
FamixDartImporter >> parser [
	^ parser
]

{ #category : #accessing }
FamixDartImporter >> parser: aMetaclass [ 
	parser := aMetaclass
]
