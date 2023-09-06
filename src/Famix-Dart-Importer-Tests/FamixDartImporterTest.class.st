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
FamixDartImporterTest >> testFunctionDeclaration [

	importer importFromString: 'TypeA functionA(int a, TypeA b, dynamic c) {
  print("hello");
}
'.

self assert: dartModel allFunctions size equals: 1
	
]

{ #category : #tests }
FamixDartImporterTest >> testFunctionDeclarationNoParameter [

	importer importFromString: 'TypeA functionA() {
  print("hello");
}
'.

self assert: dartModel allFunctions size equals: 1
	
]

{ #category : #tests }
FamixDartImporterTest >> testParseMethodLocalVariable [

	importer importFromString: 'class A {
	void myMethod() {
      var i = 12;
  }
}'.
	self assert: dartModel allModelMethods size equals: 1.
	self
		assert: dartModel allModelMethods anyOne localVariables size
		equals: 1
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
FamixDartImporterTest >> testParseSimpleMethod [

	importer importFromString: 'class A {
	void myMethod() {
    
  }
}'.
	self assert: dartModel allModelMethods size equals: 1
]

{ #category : #tests }
FamixDartImporterTest >> testParseSimpleMethodName [

	importer importFromString: 'class A {
	void myMethod() {
    
  }
}'.
	self assert: dartModel allModelMethods size equals: 1.
	self assert: dartModel allModelMethods anyOne signature equals: 'void myMethod()'.
	self assert: dartModel allModelMethods anyOne name equals: 'myMethod'
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
