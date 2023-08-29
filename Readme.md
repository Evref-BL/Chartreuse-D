# Chartreuse-D

[![Coverage Status](https://coveralls.io/repos/github/Evref-BL/Chartreuse-D/badge.svg?branch=main)](https://coveralls.io/github/Evref-BL/Chartreuse-D?branch=main)

This is a Famix model for the Dart programming language.
It is named Chartreuse in reference to the VerveinJ importer for Java.

## Installation

```st
Metacello new
  githubUser: 'Evref-BL' project: 'Chartreuse-D' commitish: 'main' path: 'src';
  baseline: 'FamixDart';
  load
```

## Usage

```st
importer := FamixDartImporter new.
dartModel := FamixDartModel new.
importer model: dartModel.

importer importFromString: 'class A {}'.
importer model
```
