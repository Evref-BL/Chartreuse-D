Class {
	#name : #FamixDartMethod,
	#superclass : #FamixDartEntity,
	#traits : 'FamixTMethod + FamixTWithLocalVariables',
	#classTraits : 'FamixTMethod classTrait + FamixTWithLocalVariables classTrait',
	#category : #'Famix-Dart-Entities-Entities'
}

{ #category : #meta }
FamixDartMethod class >> annotation [

	<FMClass: #Method super: #FamixDartEntity>
	<package: #'Famix-Dart-Entities'>
	<generated>
	^ self
]
