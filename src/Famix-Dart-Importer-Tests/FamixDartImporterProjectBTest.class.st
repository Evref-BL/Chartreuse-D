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

{ #category : #'tests - class definition' }
FamixDartImporterProjectBTest >> testClassAHasAttribute [

	self
		assert:
			(dartModel allModelClasses detect: [ :class |
				 class name = 'ClassA' ]) attributes size
		equals: 1.
	self
		assert:
			(dartModel allModelClasses detect: [ :class |
				 class name = 'ClassA' ]) attributes anyOne name
		equals: 'world'
]

{ #category : #'tests - class definition' }
FamixDartImporterProjectBTest >> testClassAHasMethod [

	self
		assert:
			(dartModel allModelClasses detect: [ :class |
				 class name = 'ClassA' ]) methods size
		equals: 1
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

{ #category : #'tests - class definition' }
FamixDartImporterProjectBTest >> testClassASuperclassIsSuperClassA [

	self
		assert:
			(dartModel allModelClasses detect: [ :class |
				 class name = 'ClassA' ]) superclass
		equals: (dartModel allModelClasses detect: [ :class |
				 class name = 'SuperClassA' ])
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

{ #category : #'tests - local variable' }
FamixDartImporterProjectBTest >> testMethodOfClassAHasALocalVariable [

	self
		assert:
			(dartModel allModelMethods detect: [ :method |
				 method name = 'method' ]) localVariables size
		equals: 1.
	self
		assert:
			(dartModel allModelMethods detect: [ :method |
				 method name = 'method' ]) localVariables anyOne name
		equals: 'classBLocalVariable'
]

{ #category : #tests }
FamixDartImporterProjectBTest >> testModelNameIsGivenInImport [

	self assert: dartModel name equals: 'project_b'
]

{ #category : #tests }
FamixDartImporterProjectBTest >> testNumberOfClasses [
	"
	- ClassA
	- SuperClassA
	- AnotherClassB
	"

	self assert: dartModel allModelClasses size equals: 3
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
