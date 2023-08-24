Class {
	#name : #FamixDartImporter,
	#superclass : #Object,
	#instVars : [
		'model',
		'parser',
		'visitor',
		'rootPackage',
		'currentPackage',
		'importerResolvers'
	],
	#category : #'Famix-Dart-Importer'
}

{ #category : #initialization }
FamixDartImporter >> addImporterResolver: anImporterResolver [

	importerResolvers push: anImporterResolver
]

{ #category : #'private - factory' }
FamixDartImporter >> ensureAttributeNamed: aString [

	^ self model add: (FamixDartAttribut new
			   name: aString;
			   yourself)
]

{ #category : #'private - factory' }
FamixDartImporter >> ensureClassNamed: aString [

	| class |
	class := FamixDartClass new
		         name: aString;
		         yourself.
	class parentPackage: currentPackage.
	self model add: class.
	^ class
]

{ #category : #'private - factory' }
FamixDartImporter >> ensureLocalVariableNamed: aString [

	^ self model add: (FamixDartLocalVariable new
			   name: aString;
			   yourself)
]

{ #category : #'private - factory' }
FamixDartImporter >> ensureMethodNamed: aString [

	^ self model add: (FamixDartMethod new
			   name: aString;
			   yourself)
]

{ #category : #'private - factory' }
FamixDartImporter >> ensurePackageNamed: aString [

	^ self model add: (FamixDartPackage new
			   name: aString;
			   yourself)
]

{ #category : #'private - importer' }
FamixDartImporter >> importDartFilesFrom: aFileReference [

	| package |
	package := self ensurePackageNamed: aFileReference basename.
	currentPackage addChildEntity: package.
	currentPackage := package.
	(aFileReference childrenMatching: '*.dart') do: [ :dartFileReference |
		self importFromDartAST:
			(self parser parse: dartFileReference contents) ].
	aFileReference directories do: [ :directory |
		self importDartFilesFrom: directory ]
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
FamixDartImporter >> importProject: pn fromRootFolder: aFileReference [
	"I parse all dart files under a root folder and import them"
	self model name: pn.
	rootPackage := self ensurePackageNamed: pn.
	currentPackage := rootPackage.
	(aFileReference childrenMatching: '*.dart') do: [ :dartFileReference |
		self importFromDartAST:
			(self parser parse: dartFileReference contents) ].
	aFileReference directories do: [ :directory |
		self importDartFilesFrom: directory ].
	self resolveAll
]

{ #category : #initialization }
FamixDartImporter >> initialize [

	super initialize.
	parser := DartParser.
	visitor := FamixDartImporterVisitor new
		           importer: self;
		           yourself.
	importerResolvers := Stack new
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

{ #category : #'private - importer' }
FamixDartImporter >> resolveAll [

	[ importerResolvers isEmpty ] whileFalse: [
		importerResolvers pop
			importer: self;
			resolve ]
]
