Class {
	#name : #FamixDartClass,
	#superclass : #FamixDartEntity,
	#traits : 'FamixTCanBeAbstract + FamixTCanImplement + FamixTClass + FamixTHasVisibility + FamixTPackageable + FamixTType + FamixTWithAttributes + FamixTWithMethods',
	#classTraits : 'FamixTCanBeAbstract classTrait + FamixTCanImplement classTrait + FamixTClass classTrait + FamixTHasVisibility classTrait + FamixTPackageable classTrait + FamixTType classTrait + FamixTWithAttributes classTrait + FamixTWithMethods classTrait',
	#category : #'Famix-Dart-Entities-Entities'
}

{ #category : #meta }
FamixDartClass class >> annotation [

	<FMClass: #Class super: #FamixDartEntity>
	<package: #'Famix-Dart-Entities'>
	<generated>
	^ self
]
