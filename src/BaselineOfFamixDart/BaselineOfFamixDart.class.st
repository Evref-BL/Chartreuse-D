Class {
	#name : #BaselineOfFamixDart,
	#superclass : #BaselineOf,
	#category : #BaselineOfFamixDart
}

{ #category : #baselines }
BaselineOfFamixDart >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self defineDependencies: spec.

		self definePackages: spec.

		self defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfFamixDart >> defineDependencies: spec [

    spec
        baseline: 'SmaccDart'
        with: [ spec
            repository: 'github://Evref-BL/SmaccDart:main/src' ].
]

{ #category : #baselines }
BaselineOfFamixDart >> defineGroups: spec [

	
]

{ #category : #baselines }
BaselineOfFamixDart >> definePackages: spec [

	spec
		package: 'Famix-Dart-Entities';
		package: 'Famix-Dart-Generator';
		package: 'Famix-Dart-Importer'
		with: [ spec requires: #( 'SmaccDart' ) ];
		package: 'Famix-Dart-Importer-Tests'
		with: [ spec requires: #( 'Famix-Dart-Importer' ) ]
]
