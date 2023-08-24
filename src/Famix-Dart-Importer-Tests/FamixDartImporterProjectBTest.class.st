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

{ #category : #'tests - package' }
FamixDartImporterProjectBTest >> testClassAIsInSrcPackage [

	self
		assert:
			(dartModel allModelClasses detect: [ :class |
				 class name = 'ClassA' ]) parentPackage
		equals:
			((dartModel allWithType: FamixDartPackage) detect: [ :package |
				 package name = 'src' ])
]

{ #category : #tests }
FamixDartImporterProjectBTest >> testClassAIsPresent [

	dartModel allModelClasses detect: [ :class | class name = 'ClassA' ]
]

{ #category : #'tests - package' }
FamixDartImporterProjectBTest >> testClassBIsInSomepackPackage [

	self
		assert:
			(dartModel allModelClasses detect: [ :class |
				 class name = 'ClassB' ]) parentPackage
		equals:
			((dartModel allWithType: FamixDartPackage) detect: [ :package |
				 package name = 'somepack' ])
]

{ #category : #tests }
FamixDartImporterProjectBTest >> testNumberOfClasses [
	"
	- ClassA
	- AnotherClassB
	"

	self assert: dartModel allModelClasses size equals: 2
]

{ #category : #tests }
FamixDartImporterProjectBTest >> testRootPackageIsPresent [

	(dartModel allWithType: FamixDartPackage) detect: [ :package | package name = 'project_b' ]
]

{ #category : #'tests - package' }
FamixDartImporterProjectBTest >> testSomepackPackageIsInSrcPackage [

	self
		assert:
			((dartModel allWithType: FamixDartPackage) detect: [ :package |
				 package name = 'somepack' ]) parentPackage
		equals:
			((dartModel allWithType: FamixDartPackage) detect: [ :package |
				 package name = 'src' ])
]
