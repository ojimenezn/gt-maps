# GTMaps

This repository contains Swift code for a demo of GTMaps, a web-mapping platform designed to impact the decision-making process of Georgia Tech students commuting to campus. In particular, the goal of GTMaps is to positively intervene by attempting to raise awareness about COVID, and informing them about relevant safety/costs considerations for available transportation options. This project was done to satisfy the requirements of CS6795 Introduction to Cognitive Science.

## Running the App

GTMaps does not require any external dependencies and can be run in your IDE of preference. We recommend using [XCode](https://apps.apple.com/us/app/xcode/id497799835?mt=12). We use the [MapKit](https://developer.apple.com/documentation/mapkit/) framework to make directions requests. 

## Installation (may skip these steps)

Note: This project underwent several refactoring stages. To the best of our knowledge, the current of version of GTMaps **does not** require the installation packages/commands described below. We have only included them for information purposes. 

The original version of GTMaps used [cocoapods](https://cocoapods.org). In particular, it made use of [Pulley](https://github.com/52inc/Pulley) to support some application features. You may follow the instructions on their GitHub page but installation with cocoapods would simply require ```pod 'Pulley'```. 

## Requirements

- iOS 9.0+
- Swift 5.0+
