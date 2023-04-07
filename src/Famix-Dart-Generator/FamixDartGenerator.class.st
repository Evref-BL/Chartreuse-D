Class {
	#name : #FamixDartGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'class',
		'method',
		'attribute'
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

	method --|> #TMethod.

	attribute --|> #TNamedEntity.

]
