Class {
	#name : #FamixDartEntity,
	#superclass : #MooseEntity,
	#category : #'Famix-Dart-Entities-Entities'
}

{ #category : #meta }
FamixDartEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Dart-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixDartEntity class >> isAbstract [

	<generated>
	^ self == FamixDartEntity
]

{ #category : #meta }
FamixDartEntity class >> metamodel [

	<generated>
	^ FamixDartModel metamodel
]

{ #category : #testing }
FamixDartEntity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixDartEntity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixDartEntity >> isBehavioural [

	<generated>
	^ false
]

{ #category : #testing }
FamixDartEntity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixDartEntity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixDartEntity >> isLocalVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixDartEntity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixDartEntity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixDartEntity >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixDartEntity >> isType [

	<generated>
	^ false
]
