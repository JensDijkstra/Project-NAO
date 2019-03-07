# NAO Design report

## Abstract

## Table of contents
- [NAO Design report](#nao-design-report)
  * [Abstract](#abstract)
  * [Table of contents](#table-of-contents)
  * [1. Introduction](#1-introduction)
  * [2. Preparation](#2-preparation)
    + [2.1 Function Analysis](#21-function-analysis)
    + [2.2 Set of requirements](#22-set-of-requirements)
  * [3. Researched topics](#3-researched-topics)
    + [3.1 Vision](#31-vision)
    + [3.2 Speech](#32-speech)
    + [3.3 Movement](#33-movement)
  * [4. Concepts](#4-concepts)
    + [4.1 Morphological analysis](#41-morphological-analysis)
    + [4.2 Detailed description of concepts](#42-detailed-description-of-concepts)
  * [5. Considerations](#5-considerations)
    + [5.1 Scores](#51-scores)
    + [5.2 Final concept](#52-final-concept)
  * [6. Conclusion](#6-conclusion)
  * [References](#references)

## 1. Introduction

The urban upmarket healthclub **[name]** gives Tai Chi lessons. When performing Tai Chi it is important to be aware of your posture. During live classes a Sifu (master/teacher) can correct individuals on their poses. At home however, there is nobody to check if you're doing everything correctly.
A NAO robot by SolidBank is a great solution to this problem. NAO is able to move like a human and has the ability to provide live feedback to the user.

GeekySolutions has been asked to design and program the NAO so it can act as a real Tai Chi Sifu. Not only will it be able to move like a human, it will also be programmed to have meaningful interactions with the user. These interactions could be grading and correcting the user's pose, give additional information about Tai Chi and interact with the user in a personal way.
The idea is that students take a NAO home so after the live classes they can practice their pose correctly. This makes them progress much faster and more efficiently since the students still receive live feedback at home.  
The structure of this report is as follows. In the first chapter all preparations are made. Chapter 2 is all the research done to come up with concepts which are elaborated in chapter 3. Then in chapter 4 considerations between all concepts are made. Finally in chapter 5 a definite concept is chosen which suits the best with the clients wishes. This chapter also shows some global system diagrams.

## 2. Preparation

### 2.1 Function Analysis
In this chapter the basic and sub functions of the NAO robot will be explained in detail.
#### Performing the 10-form
The NAO robot will need to be able to perform 10 different Tai Chi poses.
#### Tracking movements
The robot will be able to track the users movements and calculate the angles in which the users limbs are position in.
#### Comment on poses
With the information about the angles NAO determines if all the limbs are in a certain margin of accuracy. NAO will then determine an appropriate comment on the users movements.
#### Learn faces
When NAO first meets the user it asks personal information about the user. During the 'meeting phase' it will try to learn and save the users face so that it can recognize the user later.
#### Recognize faces
Once a users face is saved it can recognize the user at any time and only respond when the correct user is found.
#### Track faces
NAO will always try to look at the users face. This makes the robot seem a bit more friendly and it can keep track of who the user in front of it is.
#### Hear
NAO can recognize certain words and phrases and then respond the them.
#### Talk
NAO can talk with the user about their training, Tai Chi and have social conversations.
#### Feel
NAO has a few touch sensors which when touched make the robot react in different ways. These sensors can be used to detect the user or other objects.
### 2.2 Set of requirements
```
| Manufacture | Functional | Requirements                                                                                               | Fixed | Variable | Extra |
|:-------------:|:------------:|-------------------------------------------------------------------------------------|:-------------------------------:|:-----:|
|             |      x     | NAO is able to recognize pre-defined speech patterns.                                                   |   x   |          |       |
|             |      x     | NAO can have at least three different social conversations with the user.                                  |       |     x    |       |
|             |      x     | NAO confirms with the user if the exercise is clear.                                                       |   x   |          |       |
|      x      |            | Certain functions and conversations can be performed through a 3rd party speech recognition API.           |       |          |   x   |
|             |      x     | If the user does not interact with NAO for 30-60 seconds, it will ask if the user still needs its service. |   x   |          |       |
|             |      x     | Users movements can be evaluated and then corrected by the NAO.                                            |       |     x    |       |
|             |      x     | NAO can remember and recognize the users face.                                                             |   x   |          |       |
|             |      x     | The vision software is able to measure the distance from the camera to the user.                           |       |     x    |       |
|             |      x     | NAO can demonstrate the postures of the Tai Chi 10-form.                                                   |   x   |          |       |
|      x      |            | Transitions between the postures are fluid                                                                 |       |     x    |       |
|             |      x     | When not performing the 10-form, the NAO looks at the user.                                                |   x   |          |       |
```
## 3. Researched topics
### 3.1 Vision
There are variant ways to make a vision program. The NAO robot will need to recognize faces and movements so the camera and program to make the vision part of the robot will be selected with these things in mind.
#### Choregraph
The robot has its own cameras. The software to program these cameras are also very easy to use. there are already basic functions for face learning and recognition build into the software. this will thus be very easy to program. Tracking movements with these cameras is a little harder. There is no build in function for this so this will need to be made from scratch. the cameras also have no 3D vision. making calculations using these cameras will thus be a lot harder.
#### Kinect
The Kinect sensor made by Microsoft for the Xbox console is specifically made to track the movements of people. This could be a very good way to track and calculate the movements of the users. There is also the possibility to recognize faces using a Kinect sensor. The hard part is that the program will need to be made from scratch using python but there are a lot of test programs online for you to use. Also the camera isn't directly connected to the NAO. You will need the use a Raspberry Pi in order to connect the sensor to the robot.
#### Others
There are some other options as well, such as using an external 3D camera. These however are usually very expensive and they are usually not made to track movements so there will not be a lot of programs you can find online. The upside is that they come in any size and shape you want and you could even buy one that you can mount onto the NAO. This is a lot more user friendly.
### 3.2 Speech
#### Speech recognition
Having a conversation between the NAO and the user requires the NAO to have speech recognition. For humans this task is simple. Their brains know what words mean and how to react to them. For robots it is not that simple. Every single word is foreign to them. The pronunciation, meaning and the expected response has to be manually programmed, or at least most of it.
This research covers two ways of speech recognition that the NAO could end up using. These are the built in speech library from Choregraph and chat bots like Google Assistant and Amazon's Alexa.
#### Built in library
Choregraph has a built in feature that allows words written in text to be converted to speech within the NAO. The library used for this feature is *ALSpeechRecognition* in Python. This library is easy to understand, but its drawback is that every word had to be hard coded. It is possible to write different conversations and make them seem spontaneous, however after using the NAO several time these 'spontaneous conversations' get repeated. From that point on NAO's speech starts getting repetitive and static. To counter this NAO's library has to be continuously updated. This is not efficient and more important expensive.
Though these flaws are clearly noticeable, they are not that bad for this particular project. The way these conversations are hard coded is useful when it comes to giving specific feedback, or when teaching something about Tai Chi. Both the input and output have to be programmed in order for this library to function.
In order to give conversations more meaning this library can be combined with many others from the NAOqi Audio set. The most useful ones are listed below:
* **ALTextToSpeech**
		This library is used to let the NAO say words that are written down in the code.
		The easiest way to program this, is to use the *say* block in Choregraph.
* **ALSoundLocalization**
		This identifies the direction of any loud enough sound heard by the robot.
		Useful to have the NAO look in the direction of the user when he/she speaks.
* **ALVoiceEmotionAnalysis**
		This identifies the emotion expressed by the speaker’s voice, independently of what is being said.
		NAO could be made to respond according to the user's expressed emotion.
#### Chat Bots
There also is the option to use a veriaty of chat bots. these sometimes cost money, but you can also get them for free. This enebles the NAO robot to have more complicated conversations and answer any questions that the user might have. This does however come with some privacy problems. These programs are free because the develepors can use your personal information to upgrade their AI. some users might not want to have this so this becomes something to take into considderation when designing the robot.
	 - [ ] Google
	 - [ ] Amazon
	 - [ ] Sphinx
	 - [ ] Others

### 3.3 Movement
	 - [ ] Regular programming
	 - [ ] Newer NAO version
	 - [ ] Mimic the user

## 4 Concepts
### 4.1 Morphological Analysis
In the table below are listed all the options for different functions of the NAO robot. all the options will be conciderd while making the final design. at least 3 concepts will be made with different themes. later the concepts will be weight against eachother and the best one will be chosen as the final design.
```
| Functions             		| Option 1                             | Option 2                              | Option 2                  | Option 4  |
|---------------------------|--------------------------------------|---------------------------------------|---------------------------|-----------|
| **User recognition**      | OpenCV with 3D webcam (3)            | Kinect connection via MQTT on Rpi     | Build in NAO camera (1,2) |           |
| **Movements recognition** | OpenCV with 3D webcam (3)            | Kinect connection via MQTT on Rpi (2) | Build in NAO camera (1)   |           |
| **Hearing**               | External microphone on the user (3)	 | NAO microphones (1,2)                 |                           |           |
| **Socializing**           | Pre-programmed speech patterns (1,2) | Chatbot (3)                           |                           |           |
```

### 4.2 Concepts
1. Cheap
2. Simple
3. High Tech
### 4.3 Detailed description of concepts
#### Cheap
This concept is the cheapest one. This is because it only uses the standard components on the NAO robot itself. The cameras on the head of the robot can be used to recognize faces and track the movements of the user. These cameras aren't the best option fo these functions, but they will get the job done. The standard microphone on the NAO is also relatively good, but you will have to get close enough to the robot so that it can hear you. To have conversations with NAO there will be some pre-progammed speech patterns in the robots code that you will have to follow. Beacause of this you can't have very complicated conversations, but that isn't really necessary.
#### Simple
The second concept is very simple based. It is the easiest to program but the price will be a little higher because it requires a Kinect sensor and Raspberry Pi. To recognize the users face there will still be made use of the NAO camera. that is because there is already a build in function in the Choregraphe software for facial recognition. For movements however there will be a Kinect sensor that is specificlaly made for movement tracking. The sensor will have to be connected to the robot via a Raspberry Pi and the code will be written in python. for the hearing and talking functions there will still be made use of the build in harware of the NAO, because this is the most simple way.
#### High Tech
The high Tech concept is probably the best option, but it is very hard to produce and also very expensive. This concept does not use the Kinect sensor but a 3D webcam that can be mounted ontop of the NAO robot. The code will be programmed using opencv in python or C++. This is very user friendly because The user doesn't have to set up the kinect on the correct place. This camera will be used for both facial recognition and movement tracking. For the robot to hear there will be a little microphone that the user can clip onto their clothes This microphone will have to be connected to the robot and it is a costs a little more money. Probably the most usefull tool that will be used in this concept is a chatbot such as the Google assistant or Siri.This way NAO is not limmited by the speech patterns inside the program. This will help the robot to be alot more user friendly and more fun to use. It can also be used to search for things on Google so dthat the robot can tell you things you want to know.

### 5 Considerations
### 5.1 Scores
### 5.2 Final concept (concept conclusion)
  - Scores conclusion
  - What the NAO is like
    -[ ]  Personality
    -[ ]  Speech
    -[ ]  Vision
    -[ ]  
#### System Diagrams
![alt text](https://github.com/JensDijkstra/Project-NAO/blob/master/Diagrams/Photo's/STM%20NAO.png)
## 6. Conclusion
## References
