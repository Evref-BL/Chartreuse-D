Class {
	#name : #FamixDartClass,
	#superclass : #FamixDartEntity,
	#traits : 'FamixTCanImplement + FamixTClass + FamixTHasVisibility + FamixTType + FamixTWithAttributes + FamixTWithMethods',
	#classTraits : 'FamixTCanImplement classTrait + FamixTClass classTrait + FamixTHasVisibility classTrait + FamixTType classTrait + FamixTWithAttributes classTrait + FamixTWithMethods classTrait',
	#category : #'Famix-Dart-Entities-Entities'
}

{ #category : #meta }
FamixDartClass class >> annotation [

	<FMClass: #Class super: #FamixDartEntity>
	<package: #'Famix-Dart-Entities'>
	<generated>
	^ self
]
