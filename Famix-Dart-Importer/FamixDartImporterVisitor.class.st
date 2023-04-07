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
	stackScope := Stack new
]

{ #category : #generated }
FamixDartImporterVisitor >> visitClassDeclaration: aClassDeclaration [

	| classType famixEntity |
	classType := (aClassDeclaration children detect: [ :c | 
		              c isKindOf: DartTypeNode ]) typeIdentifier value.
	famixEntity := self importer ensureClassNamed: classType.

	self flag: 'faire la completion de l object famix ici'.


	stackScope push: aClassDeclaration -> famixEntity.
	self visitProgram: aClassDeclaration.
	stackScope pop.
	^ famixEntity
]

{ #category : #generated }
FamixDartImporterVisitor >> visitClassMemberDefinition: aClassMemberDefinition [

	| famixEntity |
	
	aClassMemberDefinition nodeVariables. "#(#methodSignature #functionBody #declaration)" "method"
	1 halt.

	aClassMemberDefinition methodSignature ifNotNil: [ 
		| name |
		name := (aClassMemberDefinition methodSignature topParent
			         completeSource
			         copyFrom:
			         aClassMemberDefinition methodSignature startPosition
			         to: aClassMemberDefinition methodSignature stopPosition)
			        asString , ')'.
	
		famixEntity := self importer ensureMethodNamed: name. 
		 famixEntity parentType: stackScope lastLink value value. 
		
		 ].

	aClassMemberDefinition declaration ifNotNil: [ 
		| name |
		
		
		
		name := (aClassMemberDefinition declaration topParent
			         completeSource
			         copyFrom:
			         aClassMemberDefinition declaration startPosition
			         to: aClassMemberDefinition declaration stopPosition)
			        asString , ')'.
		 ].



	stackScope push: (aClassMemberDefinition -> famixEntity).

	self visitProgram: aClassMemberDefinition.
	^ stackScope pop
]
