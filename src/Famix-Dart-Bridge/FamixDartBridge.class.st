Class {
	#name : #FamixDartBridge,
	#superclass : #GitBridge,
	#category : #'Famix-Dart-Bridge'
}

{ #category : #'class initialization' }
FamixDartBridge class >> initialize [

	SessionManager default registerSystemClassNamed: self name
]

{ #category : #'class initialization' }
FamixDartBridge class >> testsResources [

	^ self root / 'tests-res'
]

{ #category : #'class initialization' }
FamixDartBridge class >> testsResourcesProjectA [

	^ self testsResources / 'projectA'
]
