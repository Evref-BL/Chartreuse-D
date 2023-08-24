Class {
	#name : #FamixDartImporterResolver,
	#superclass : #Object,
	#category : #'Famix-Dart-Importer'
}

{ #category : #navigating }
FamixDartImporterResolver >> resolve [
	"return true if everything goes well. false otherwise"

	^ self subclassResponsibility
]
