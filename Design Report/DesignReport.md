# NAO Design report

## Abstract

## Index


## Introduction

The urban upmarket healthclub **[name]** gives Tai Chi lessons. When performing Tai Chi it is important to be aware of your posture. During live classes a Sifu can correct individuals on their poses. At home however, there is nobody to check if you're doing everything correctly.
A NAO robot by SolidBank is a great solution to this problem. NAO is able to move like a human and has the ability to provide live feedback to the user.

GeekySolutions has been asked to design and program the NAO so it can act as a real Tai Chi Sifu. Not only will it be able to move like a human, it will also be programmed to have meaningful interactions with the user. These interactions could be grading and correcting the user's pose, give additional information about Tai Chi and interact with the user in a personal way.
The idea is that students take a NAO home so after the live classes they can practice their pose correctly. This makes them progress much faster and more efficiently since the students still receive live feedback at home.  
The structure of this report is as follows. In the first chapter all preparations are made. Chapter 2 is all the research done to come up with concepts which are elaborated in chapter 3. Then in chapter 4 considerations between all concepts are made. Finally in chapter 5 a definite concept is chosen which suits the best with the clients wishes. This chapter also shows some global system diagrams.




## Preparation

### Function Analysis
In this chapter the basic and sub functions of the NAO robot will be explained in detail.
#### Performing the 10-form
The NAO robot will need to be able to perform 10 different Tai-Chi poses.
#### Tracking movements
The robot will be able to track the users movements and calculate the angles in witch the users limbs are position in.
#### Comment on poses
With the information about the angles NAO determines if all the limbs are in a certain margin of accuracie. NAO will then determine an appropriate comment on the users movements.
#### Learn faces
When NAO first meets the user it will ask some personal information about the user and during that time it will try to learn and save the users face so that it can recognie the user later.
#### Recognice faces
Once a users face is saved it can recognice the user at any thime and only respond when the correct user is found.
#### Track faces
Nao will always try to look at the users face. This makes the robot seem a bit more friendly and it can keep track of who the user in front of it is.
#### Hear
Nao can recognice certain words and frases and then respond the them.
#### Talk
Nao can talk with the user about their training but also about some personal stuf and background information.
#### Feel
NAO has a few touch sensors wich when touched make the robot treact in different ways.
### Set of requirements
```
| Manufacture | Functional | Requirements                                                                                               | Fixed | Variable | Extra |
|:-------------:|:------------:|-------------------------------------------------------------------------------------|:-------------------------------:|:-----:|
|             |      x     | NAO is able to recognize pre-defined speech patterns.                                                   |   x   |          |       |
|             |      x     | NAO can have at least three different social conversations with the user.                                  |       |     x    |       |
|             |      x     | NAO confirms with the user if the exercise is clear.                                                       |   x   |          |       |
|      x      |            | Certain functions and conversations can be performed through a 3rd party speech recognition API.           |       |          |   x   |
|             |      x     | If the user does not interact with NAO for 30-60 seconds, it will ask if the user still needs its service. |   x   |          |       |
|             |      x     | Gegevens worden opgehaald. Wacht een paar seconden en knip of kopieer vervolgens opnieuw.                  |       |          |   x   |
|             |      x     | Users movements can be evaluated and then corrected by the NAO.                                            |       |     x    |       |
|             |      x     | NAO can remember and recognice the users face.                                                             |   x   |          |       |
|             |      x     | The vision software is able to measure the distance from the camera to the user.                           |       |     x    |       |
|             |      x     | NAO can demonstrate the postures of the Tai Chi 10-form.                                                   |   x   |          |       |
|      x      |            | Transitions between the postures are fluid                                                                 |       |     x    |       |
|             |      x     | When not performing the 10-form, the NAO looks at the user.                                                |   x   |          |       |
```
### Researched topics
#### Vision
There are variant different ways to make a vision program. The NAO robot will need to recognize faces and movements so the camera and program to make the vision part of the robot will be selected with these things in mind.
##### Choregraph
The robot has its own cameras. The software to program these cameras are also very easy to use. there are already basic functions for face learning and recognition build into the software. this will thus be very easy to program. Tracking movements with these cameras is a little harder. There is no build in function for this so this will need to be made from scratch. the cameras also have no 3D vision. making calculations using these cameras will thus be a lot harder. 
##### Kinect
The Kinect sensor made by Microsoft for the Xbox console is specificlaly made to track the movements of people. This could be a very good way to track and calculate the movements of the users. There is also the possibility to recognize faes using a Kinect sensor. The hard part is that the program will need to be made from scratch using python but there are a lot of test programs online for you to use. Also the camera isn't directly connected to the NAO. You will need the use a Raspberry Pi in order to connect the sensor to the robot.
##### Others
There are some other options as well, such as using an external 3D camera. These however are usually very expensive and they are usually not made to track movements so there will not be a lot of programs you can find online. The upside is that they come in any size and shape you want and you could even buy one that you can mount onto the NAO. This is a lot more user friendly.
#### Speech
##### Voice recognition
###### How it works
##### Built in library
##### Chat Bots
	 - [ ] Google
	 - [ ] Amazon
	 - [ ] Sphinx
	 - [ ] Others

#### Movement
	 - [ ] Regular programming
	 - [ ] Newer NAO version
	 - [ ] Mimic the user

### Morphological analysis
#### (at least) 3 Different concepts
###### No description yet*

## Concepts
### Detailed description of concepts
### Considerations
### Scores
### Final concept
#### System Diagrams
## Conclusion
## References

<!--stackedit_data:
eyJoaXN0b3J5IjpbMTYxNTQ4ODA1LDE4MDc4Njk4NSwyMDA5Nz
IxMDM2LC03OTk1OTI2MjUsMzg5MjUyMzEsMTgzODg0ODY0Nywt
NDMzNjI2OTY5LDEwMDA1Njg0MDUsMTI3ODgwODUzOCw1MjY3OD
QwODcsLTE2ODYzNTU4LC0xMTQ1MjUxNjMxLDE1NTI0NTYzMzIs
LTE0NzIyNDY4MzYsODE5MTU4NzAsLTk2MjEzMDU2NiwxODMzNj
MwMjQzXX0=
-->