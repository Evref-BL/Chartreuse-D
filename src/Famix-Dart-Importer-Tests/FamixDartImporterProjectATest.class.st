Class {
	#name : #FamixDartImporterProjectATest,
	#superclass : #TestCase,
	#instVars : [
		'importer',
		'dartModel'
	],
	#category : #'Famix-Dart-Importer-Tests'
}

{ #category : #running }
FamixDartImporterProjectATest >> setUp [

	super setUp.

	importer := FamixDartImporter new.
	dartModel := FamixDartModel new.
	importer model: dartModel.
	importer importProject: FamixDartBridge testsResourcesProjectA
]

{ #category : #tests }
FamixDartImporterProjectATest >> testClassAIsPresent [

	self assert: dartModel allModelClasses size equals: 1
]
