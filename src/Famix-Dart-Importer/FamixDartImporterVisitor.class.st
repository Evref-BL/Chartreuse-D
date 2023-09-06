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

	aClassDeclaration superclass ifNotNil: [ :superClass |
		self importer addImporterResolver:
			(FamixDartImporterInheritanceResolver new
				 subclass: famixEntity;
				 context: superClass;
				 yourself) ].

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
	(aClassMemberDefinition signature notNil and: [
		 aClassMemberDefinition functionBody notNil ]) ifTrue: [
		| signature pMethod|
		
	 
		pMethod := ProxySmaCCDartMethodNode fromNode: aClassMemberDefinition. 
		
		
		famixEntity := self importer ensureMethodNamed:
			               pMethod functionIdentifier.
		famixEntity signature: pMethod signature.

		self stackScope lastLink value value addMethod: famixEntity ].

	"declaration equals attributs"
	aClassMemberDefinition declaration ifNotNil: [
		| name |
		name := aClassMemberDefinition declaration initializedIdentifierList
			        initializedIdentifier identifier idNotFunction value.
		famixEntity := self importer ensureAttributeNamed: name.
		self stackScope lastLink value value addAttribute: famixEntity ].



	self stackScope push: aClassMemberDefinition -> famixEntity.

	self visitProgram: aClassMemberDefinition.
	^ self stackScope pop
]

{ #category : #generated }
FamixDartImporterVisitor >> visitFunctionDeclaration: aFunctionDeclaration [
	|famixEntity|

"	aFunctionDeclaration nodeVariables ""#(#signature #body)""."

	
	(aFunctionDeclaration signature notNil and: [
		 aFunctionDeclaration body notNil ]) ifTrue:[
		| signature proxy|
		

		proxy := ProxySmaCCDartFunctionNode fromNode: aFunctionDeclaration. 
		signature := proxy signature. 
		
		famixEntity := self importer ensureFunctionNamed: proxy functionIdentifier.

		famixEntity signature: signature.
		
		famixEntity declaredType: (self importer ensureTypeNamed: proxy returnedType).
		
	

		"famixEntity addParameter: (self importer ensureParameterNames: aFunctionDeclaration )"
		proxy parameters do: [ :each | 
			|famixParameter|
			
			famixParameter := (self importer ensureParameterNamed: each identifier). 
			famixParameter declaredType: (self importer ensureTypeNamed: each type).
			
			famixEntity addParameter: famixParameter.
			 ]
		
	].
	
	^  self visitProgram: aFunctionDeclaration
]

{ #category : #generated }
FamixDartImporterVisitor >> visitInitializedVariableDeclaration: anInitializedVariableDeclaration [

	| localVariable |
	localVariable := self importer ensureLocalVariableNamed:
		                 anInitializedVariableDeclaration declaredIdentifier
			                 declaredIdentifier idNotFunction value.
	self stackScope top value addLocalVariable: localVariable
]
