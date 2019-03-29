<?xml version="1.0" encoding="UTF-8" ?>
<Package name="Speech" format_version="4">
    <Manifest src="manifest.xml" />
    <BehaviorDescriptions>
        <BehaviorDescription name="behavior" src="behavior_1" xar="behavior.xar" />
    </BehaviorDescriptions>
    <Dialogs>
        <Dialog name="Bier" src="Bier/Bier.dlg" />
        <Dialog name="Greeting" src="Greeting/Greeting.dlg" />
        <Dialog name="Start training" src="Start training/Start training.dlg" />
        <Dialog name="trainingStart" src="trainingStart/trainingStart.dlg" />
        <Dialog name="Start up" src="Start up/Start up.dlg" />
    </Dialogs>
    <Resources>
        <File name="choice_sentences" src="behavior_1/Aldebaran/choice_sentences.xml" />
        <File name="blue" src="Music/blue.wav" />
        <File name="classic" src="Music/classic.wav" />
        <File name="pop" src="Music/pop.wav" />
        <File name="rock" src="Music/rock.wav" />
        <File name="swiftswords_ext" src="behavior_1/swiftswords_ext.mp3" />
        <File name="numa" src="Music/numa.wav" />
        <File name="images" src="Images/images.jpg" />
        <File name="sifu" src="Images/sifu.png" />
        <File name="blue_distorted" src="Music/blue_distorted.wav" />
    </Resources>
    <Topics>
        <Topic name="Bier_enu" src="Bier/Bier_enu.top" topicName="Bier" language="en_US" />
        <Topic name="Greeting_enu" src="Greeting/Greeting_enu.top" topicName="Greeting" language="en_US" />
        <Topic name="Start training_enu" src="Start training/Start training_enu.top" topicName="" language="" />
        <Topic name="trainingStart_enu" src="trainingStart/trainingStart_enu.top" topicName="trainingStart" language="en_US" />
        <Topic name="Start up_enu" src="Start up/Start up_enu.top" topicName="Startup" language="en_US" />
    </Topics>
    <IgnoredPaths />
</Package>
