"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.
"
Trait {
	#name : #FamixDartTEntityCreator,
	#category : #'Famix-Dart-Entities-Model'
}

{ #category : #meta }
FamixDartTEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Dart-Entities'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FamixDartTEntityCreator >> newAttribut [

	<generated>
	^ self add: FamixDartAttribut new
]

{ #category : #'entity creation' }
FamixDartTEntityCreator >> newAttributNamed: aName [

	<generated>
	^ self add: (FamixDartAttribut named: aName)
]

{ #category : #'entity creation' }
FamixDartTEntityCreator >> newClass [

	<generated>
	^ self add: FamixDartClass new
]

{ #category : #'entity creation' }
FamixDartTEntityCreator >> newClassNamed: aName [

	<generated>
	^ self add: (FamixDartClass named: aName)
]

{ #category : #'entity creation' }
FamixDartTEntityCreator >> newLocalVariable [

	<generated>
	^ self add: FamixDartLocalVariable new
]

{ #category : #'entity creation' }
FamixDartTEntityCreator >> newLocalVariableNamed: aName [

	<generated>
	^ self add: (FamixDartLocalVariable named: aName)
]

{ #category : #'entity creation' }
FamixDartTEntityCreator >> newMethod [

	<generated>
	^ self add: FamixDartMethod new
]

{ #category : #'entity creation' }
FamixDartTEntityCreator >> newMethodNamed: aName [

	<generated>
	^ self add: (FamixDartMethod named: aName)
]

{ #category : #'entity creation' }
FamixDartTEntityCreator >> newPackage [

	<generated>
	^ self add: FamixDartPackage new
]

{ #category : #'entity creation' }
FamixDartTEntityCreator >> newPackageNamed: aName [

	<generated>
	^ self add: (FamixDartPackage named: aName)
]
