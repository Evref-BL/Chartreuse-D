Class {
	#name : #FamixDartPackage,
	#superclass : #FamixDartEntity,
	#traits : 'FamixTPackage + FamixTPackageable',
	#classTraits : 'FamixTPackage classTrait + FamixTPackageable classTrait',
	#category : #'Famix-Dart-Entities-Entities'
}

{ #category : #meta }
FamixDartPackage class >> annotation [

	<FMClass: #Package super: #FamixDartEntity>
	<package: #'Famix-Dart-Entities'>
	<generated>
	^ self
]
