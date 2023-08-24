Class {
	#name : #FamixDartGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'class',
		'method',
		'attribute',
		'package',
		'localVariable'
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
	localVariable := builder newClassNamed: #LocalVariable
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

	attribute --|> #TAttribute.
	localVariable --|> #TLocalVariable.

	package --|> #TPackage.
	package --|> #TPackageable
]
