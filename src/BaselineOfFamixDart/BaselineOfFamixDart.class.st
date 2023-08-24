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
		with: [ spec repository: 'github://Evref-BL/SmaccDart:main/src' ].
	spec
		baseline: 'GitBridge'
		with: [ spec repository: 'github://jecisc/GitBridge:v1.x.x/src' ]
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
		package: 'Famix-Dart-Bridge'
		with: [ spec requires: #( 'GitBridge' ) ];
		package: 'Famix-Dart-Importer-Tests'
		with: [
			spec requires: #( 'Famix-Dart-Importer' 'Famix-Dart-Bridge' ) ]
]
