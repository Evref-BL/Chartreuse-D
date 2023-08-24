Class {
	#name : #FamixDartImporterProjectBTest,
	#superclass : #TestCase,
	#instVars : [
		'importer',
		'dartModel'
	],
	#category : #'Famix-Dart-Importer-Tests'
}

{ #category : #running }
FamixDartImporterProjectBTest >> setUp [

	super setUp.

	importer := FamixDartImporter new.
	dartModel := FamixDartModel new.
	importer model: dartModel.
	importer
		importProject: 'project_b'
		fromRootFolder: FamixDartBridge testsResourcesProjectB
]

{ #category : #tests }
FamixDartImporterProjectBTest >> testClassAIsPresent [

	dartModel allModelClasses detect: [ :class | class name = 'ClassA' ]
]

{ #category : #tests }
FamixDartImporterProjectBTest >> testNumberOfClasses [
	"
	- ClassA
	- AnotherClassB
	"

	self assert: dartModel allModelClasses size equals: 2
]
