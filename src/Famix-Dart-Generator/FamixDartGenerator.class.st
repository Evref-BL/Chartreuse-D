"
Generate the model 
```st
FamixDartGenerator generate
```

"
Class {
	#name : #FamixDartGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'class',
		'method',
		'attribute',
		'package',
		'localVariable',
		'inheritance',
		'function',
		'primitiveType',
		'type',
		'parameter'
	],
	#category : #'Famix-Dart-Generator'
}

{ #category : #accessing }
FamixDartGenerator class >> packageName [

	^ #'Famix-Dart-Entities'
]

{ #category : #accessing }
FamixDartGenerator class >> prefix [

	^ #FamixDart
]

{ #category : #accessing }
FamixDartGenerator class >> submetamodels [

	^ { FamixGenerator }
]

{ #category : #definition }
FamixDartGenerator >> defineClasses [

	super defineClasses.

	class := builder newClassNamed: #Class.
	method := builder newClassNamed: #Method.
	attribute := builder newClassNamed: #Attribut.
	package := builder newClassNamed: #Package.
	localVariable := builder newClassNamed: #LocalVariable.
	
	function := builder newClassNamed: #Function. 
	
	primitiveType := builder newClassNamed: #PrimitiveType. 
	type := builder newClassNamed: #Type. 
	parameter := builder newClassNamed: #Parameter.
	
	
	
	"relation by traits"
	inheritance := builder newClassNamed: #Inheritance
]

{ #category : #definition }
FamixDartGenerator >> defineHierarchy [

	super defineHierarchy.

	class --|> #TClass.
	class --|> #TType.
	class --|> #THasVisibility. "if begins with underscore _"
	class --|> #TCanImplement.
	class --|> #TWithMethods.
	class --|> #TWithAttributes.
	class --|> #TPackageable.
	"About modifiers"
	class --|> #TCanBeAbstract.

	method --|> #TMethod.
	method --|> #TWithLocalVariables.
	
	type --|> #TType.
	primitiveType --|> #TPrimitiveType.
	
	function --|> #TFunction.
	parameter --|> #TParameter.

	attribute --|> #TAttribute.
	localVariable --|> #TLocalVariable.

	package --|> #TPackage.
	package --|> #TPackageable.
	
	"relations"
	inheritance --|> #TInheritance
]
