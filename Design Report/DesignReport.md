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

The urban upmarket healthclub gives Tai Chi lessons. When performing Tai Chi it is important to be aware of your posture. During live classes a Sifu (master/teacher) can correct individuals on their poses. At home however, there is nobody to check if you're doing everything correctly.
A NAO robot by SolidBank is a great solution to this problem. NAO is able to move like a human and has the ability to provide live feedback to the user.

GeekySolutions has been asked to design and program the NAO so it can act as a real Tai Chi Sifu. Not only will it be able to move like a human, it will also be programmed to have meaningful interactions with the user. These interactions could be grading and correcting the user's pose, give additional information about Tai Chi and interact with the user in a personal way.
The idea is that students take a NAO home so after the live classes they can practice their pose correctly. This makes them progress much faster and more efficiently since the students still receive live feedback at home.  
The structure of this report is as follows. In the first chapter all preparations are made. Chapter 2 is all the research done to come up with concepts which are elaborated in chapter 3. Then in chapter 4 considerations between all concepts are made. Finally in chapter 5 a definite concept is chosen which suits the best with the clients wishes. This chapter also shows some global system diagrams.

## 2. Preparation
### 2.1 Function Analysis
In this chapter the basic and sub functions of the NAO Tai Chi master will be explained in detail.
#### Performing the 10-form
The NAO robot has to perform the 10-form in a way that the user knows how to transition from form to form.
#### Tracking movements
The robot is able to track the user's movements and calculate the angles in which the users limbs are positioned in. These angles are compared to his own.
#### Comment on poses
With the information about the angles NAO determines if all the limbs are positioned correctly.  NAO will then determine an appropriate comment on the users movements. The allowed amount of deviation from NAO's angles has to be specified beforehand.
#### Learn faces
When NAO first meets the user it asks personal information about the user. During the meeting it tries to learn and save the users face so it can be recognized in the future.
#### Recognize faces
Once a users face is saved it can recognize the user at any time. A personal greeting will be initiated if NAO knows the user.
#### Track faces
NAO will always try to look at the users face. This makes the robot seem more engaged and it can keep track of who the user in front of it is.
#### Hear
NAO can recognize certain words and phrases and respond to them in a meaningful way.
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
There also is the option to use a variety of chat bots. these sometimes cost money, but you can also get them for free. This enables the NAO robot to have more complicated conversations and answer any questions that the user might have. This does however come with some privacy problems. These programs are free because the developers can use your personal information to upgrade their AI. some users might not want to have this so this becomes something to take into consideration when designing the robot.
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
In the table below are listed all the options for different functions of the NAO robot. all the options will be considered while making the final design. at least 3 concepts will be made with different themes. later the concepts will be weight against each other and the best one will be chosen as the final design.
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
This concept is the cheapest. This is because it only uses the standard components of the NAO robot itself. The cameras on the head of the robot is used to recognize faces and track the movements of the user. These cameras will not give you the most detailed readings, but they should get the job done. The standard microphone on the NAO works relatively well for the required functions it preforms, but you have to get close enough to the robot so that it can clearly hear and understand you. To have conversations with NAO there will be some pre-programmed speech patterns in the robot's code that the user has to adhere to. Because of this you can't have very complicated conversations, but it takes less work to finish the NAO which lessens the final costs.
#### Simple
The second concept is very simple based. It is the easiest to program but the price will be a little higher because it requires a Kinect sensor and RaspberryPi. To recognize the user's face NAO's camera is used. This because there is already a built in function in the Choregraphe software for facial recognition. For the detection of movements however a Kinect sensor is used, which is specifically made for movement tracking. The sensor will have to be connected to the robot via a RaspberryPi and the code will be written in Python. For NAO's hearing and talking Choregraph is used, since all the needed functions are already integrated in there. Because of the addition of a RaspberryPi and Kinect the costs for this concept lay a little higher than the 'cheap' concept.
#### High Tech
The high Tech concept is probably the best option, but it is very hard to produce and also very expensive. This concept does not use the Kinect sensor but a 3D webcam that can be mounted on top of the NAO robot. The code will be programmed using opencv in python or C++. This is very user friendly because The user doesn't have to set up the Kinect on the correct place. This camera will be used for both facial recognition and movement tracking. For the robot to hear there will be a little microphone that the user can clip onto their clothes This microphone will have to be connected to the robot and it costs a little more money. Probably the most useful tool that will be used in this concept is a chatbot such as **INSERT CHATBOT NAME**. This way NAO is not limited by the speech patterns inside the program. This will help the robot to be a lot more user friendly and more fun to use. It can also be used to search for things on Google so that the robot can tell you things you want to know.

### 5 Considerations
### 5.1 Scores
### 5.2 Kesselring
### 5.3 Final concept (concept conclusion)
  - Scores conclusion
  - What the NAO is like
    -[ ]  Personality
    Real life Sifu's tend to be strict and serious. This strict way of teaching is not something most people want, when they are in the comfort of their own home. A logical way to make the NAO fit in the relaxed environment at home is to make him happy and even a little funny at times.
    During the training NAO will watch you closely he gives you feedback in a relaxing manner. Not forcing you to improve or always pointing out the mistakes and leave out the positives. Users will feel that they can practice Tai Chi at their own pace.
    When not in training, NAO is happy and occasionally tells jokes. If anything triggers the third party speech software, NAO will run the created text through Choregraph to keep the same tone as he did before the trigger.
    -[ ]  Speech
    *Read above and give more info*
    -[ ]  Vision
    -[ ]  Name
    Now that NAO is designed like a human, it's time to give NAO a human name. The name we settled on is Blue, since he (yes, Blue is a he) is coloured blue and blue stands for a healthy and long life in Chinese. This is also a reason people practice Tai Chi. A small detail that adds more meaning to the NAO robot.
#### System Diagrams
In this chapter the system diagrams that were made for designing purposes of the NAO robot will be explained in detail.
##### STM
First there is the State Machine Diagram. This is the main diagram of Blue. All the functions in this diagram will be further elaborated in the activity diagrams or other diagrams below. Right after Blue wakes up he will start with a greeting. After that he will ask what you want to do and listens to your response. If you just want to socialize you can also do that. If you want to immediately start training you can ask Blue to start the training. If you don't respond for more than 50 seconds, Blue will go into an idle state. He will only come out of idle if you call his name. If you still don't respond for another 50 seconds, Blue will go into the valediction state and he will say its goodbyes and shut down. Blue will also shut down if the user says goodbye first.
![](https://github.com/JensDijkstra/Project-NAO/blob/master/Diagrams/Photo's/STM%20NAO.png)
##### Greeting
In the greeting state Blue will look at your face to see if he recognizes you. If he does, he greets you. If he doesn't he will try to learn your face. This is explained further in the face learning diagram.

![](https://github.com/JensDijkstra/Project-NAO/blob/master/Diagrams/Photo's/Greeting%20ACT.png)
##### Face learning
When Blue goes into the learn face state he will first ask your name. He does this because a name needs to be linked to your face in the database. After you say your name, he will greet you and simultaneously scan for any faces in front of him. If the face scan is successful, Blue will give a success massage and continue. If he fails the face scan he will give an error and you can try again. If this process fails more than ten times the program will shut down.
![](https://github.com/JensDijkstra/Project-NAO/blob/master/Diagrams/Photo's/Learning%20Face%20ACT.png)
##### Listening
After the greeting, Blue will ask what you want to do. You can respond to this with socializing or teaching. If you say something he doesn't understand, he will give an error and try again.
![](https://github.com/JensDijkstra/Project-NAO/blob/master/Diagrams/Photo's/Listen%20ACT.png)
##### Teaching
If you choose to go for teaching you will get three options: you can ask for some information about Tai-Chi, you can start a full training program or you can do a single pose.
###### Information
If you want information you just ask Blue a question and he will answer it. If Blue doesn't understand the question or he doesn't know the answer, he will say: "Subject not known. Let's talk about something else", and you can try again.
###### Tai-Chi
If you want the full training you can ask for the tai chi training. Blue will begin the lesson by telling you what you will need to do. After that he will do the first pose and asks you to repeat after him. If you do the pose correctly, Blue will compliment you and then continue. If you do something wrong, Blue will say what you can improve and how to do that. This is repeated until you do the pose correctly. Blue will repeat this for every pose.
###### Single poses
You can also ask to do a specific pose. Blue will do the same as with the Tai-Chi training but now only with one pose and he will stop if you are done with this pose.
![](https://github.com/JensDijkstra/Project-NAO/blob/master/Diagrams/Photo's/Teaching%20ACT.png)
##### Valediction
If you are done for the day, you can tell Blue you want to stop and he will go into the valediction state. In this state he will give you some tips on how to continue your training. He also asks if you have any questions. If you do, you can just ask Blue your question and he will give you an answer. Blue will repeat this until you don't have any questions left. Lastly he says goodbye and shuts down.

![](https://github.com/JensDijkstra/Project-NAO/blob/master/Diagrams/Photo's/Valedication%20ACT.png)
## 6. Conclusion
## References
