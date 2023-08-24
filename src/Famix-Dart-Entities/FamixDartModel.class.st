Class {
	#name : #FamixDartModel,
	#superclass : #MooseModel,
	#traits : 'FamixDartTEntityCreator',
	#classTraits : 'FamixDartTEntityCreator classTrait',
	#category : #'Famix-Dart-Entities-Model'
}

{ #category : #accessing }
FamixDartModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : #meta }
FamixDartModel class >> annotation [
	<FMClass: #FamixDartModel super: #MooseModel>
	<package: #'Famix-Dart-Entities'>
	<generated>
]
