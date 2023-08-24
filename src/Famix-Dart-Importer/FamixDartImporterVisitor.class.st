Class {
	#name : #FamixDartImporterVisitor,
	#superclass : #Object,
	#traits : 'TDartProgramNodeVisitor',
	#classTraits : 'TDartProgramNodeVisitor classTrait',
	#instVars : [
		'importer',
		'stackScope'
	],
	#category : #'Famix-Dart-Importer'
}

{ #category : #'private - exploration' }
FamixDartImporterVisitor >> dectectIf: aDartNode hasChildType: aClass [ 
	
	aDartNode allChildren.
	
	self shouldBeImplemented.
]

{ #category : #accessing }
FamixDartImporterVisitor >> importer [
	^ importer
]

{ #category : #accessing }
FamixDartImporterVisitor >> importer: aFamixDartImporter [ 
	importer := aFamixDartImporter
]

{ #category : #initialization }
FamixDartImporterVisitor >> initialize [

	super initialize.
	self stackScope: Stack new
]

{ #category : #accessing }
FamixDartImporterVisitor >> stackScope [

	^ stackScope
]

{ #category : #accessing }
FamixDartImporterVisitor >> stackScope: anObject [

	stackScope := anObject
]

{ #category : #generated }
FamixDartImporterVisitor >> visitClassDeclaration: aClassDeclaration [

	| classType famixEntity |
	classType := (aClassDeclaration children detect: [ :c | 
		              c isKindOf: DartTypeNode ]) typeIdentifier value.
	famixEntity := self importer ensureClassNamed: classType.

	self flag: 'faire la completion de l object famix ici'.


	self stackScope push: aClassDeclaration -> famixEntity.
	self visitProgram: aClassDeclaration.
	self stackScope pop.
	^ famixEntity
]

{ #category : #generated }
FamixDartImporterVisitor >> visitClassMemberDefinition: aClassMemberDefinition [

	| famixEntity |
	aClassMemberDefinition nodeVariables. "#(#methodSignature #functionBody #declaration)" "method"

	"si definition est une methode avec signature et un body"
	(aClassMemberDefinition methodSignature ~= nil and: [
		 aClassMemberDefinition functionBody ~= nil ]) ifTrue: [
		| signature |
		signature := (aClassMemberDefinition methodSignature topParent
			              completeSource
			              copyFrom:
			              aClassMemberDefinition methodSignature startPosition
			              to:
			              aClassMemberDefinition methodSignature stopPosition)
			             asString , ')'.
		famixEntity := self importer ensureMethodNamed:
			               aClassMemberDefinition methodSignature
				               functionSignature identifierNotFUNCTION value.
		famixEntity signature: signature.

		famixEntity parentType: self stackScope lastLink value value ].

	"declaration equals attributs"
	aClassMemberDefinition declaration ifNotNil: [
		| name |
		name := (aClassMemberDefinition declaration topParent completeSource
			         copyFrom: aClassMemberDefinition declaration startPosition
			         to: aClassMemberDefinition declaration stopPosition)
			        asString.

		famixEntity := self importer ensureAttributeNamed: name.
		famixEntity parentType: self stackScope lastLink value value ].



	self stackScope push: aClassMemberDefinition -> famixEntity.

	self visitProgram: aClassMemberDefinition.
	^ self stackScope pop
]
