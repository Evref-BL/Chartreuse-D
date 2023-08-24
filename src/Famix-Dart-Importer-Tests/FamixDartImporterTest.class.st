"
A FamixDartImporterTest is a test class for testing the behavior of FamixDartImporter
"
Class {
	#name : #FamixDartImporterTest,
	#superclass : #TestCase,
	#instVars : [
		'importer',
		'dartModel'
	],
	#category : #'Famix-Dart-Importer-Tests'
}

{ #category : #running }
FamixDartImporterTest >> setUp [

	super setUp.

	importer := FamixDartImporter new.
	dartModel := FamixDartModel new.
	importer model: dartModel
]

{ #category : #tests }
FamixDartImporterTest >> testParseSimpleClass [

	importer importFromString: 'class A {}'.
	self assert: dartModel allModelClasses size equals: 1
]

{ #category : #tests }
FamixDartImporterTest >> testParseSimpleClassWithAttribute [

	importer importFromString: 'class A {
	int myInt;
 	String myString;
	}'.
	self
		assert: (dartModel allWithType: FamixDartAttribut) size
		equals: 2
]

{ #category : #tests }
FamixDartImporterTest >> testSimpleAttributesAreInClassA [

	| attributes classA |
	importer importFromString: 'class A {
	int myInt;
 	String myString;
	}'.
	attributes := dartModel allWithType: FamixDartAttribut.
	classA := (dartModel allWithType: FamixDartClass) anyOne.
	self assert: attributes size equals: 2.
	attributes do: [ :attribute |
		self assert: attribute parentType equals: classA ]
]
