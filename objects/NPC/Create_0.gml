/// @description Insert description here
// You can write your code in this editor

/// @instancevar {String} mood;


/// @instancevar {Real} phraseSet; 


Update = function()
{
}

CreateDialog = function()
{
    var camera = view_camera[0];

    var dialogBoxX = self.x; //camera_get_view_x(camera) + (display_get_width());
    var dialogBoxY = self.y; //camera_get_view_y(camera) + display_get_height();

    show_debug_message("Creating dialog at x:" + string(dialogBoxX) + " y: " + string(dialogBoxY));

    var phrases = ["no mood set!"];

    if (self.mood == "serious")
    {
        phrases = self.phrasesSerious[self.phraseSet];
    }
    else if (self.mood == "cheery")
    {
        phrases = self.phrasesCheery[self.phraseSet];
    }
    else if (self.mood == "angry")
    {
        phrases = self.phrasesAngry[self.phraseSet];
    }

    show_debug_message("mood: " + self.mood, + ", phrases: " + string(phrases));

    instance_create_layer(dialogBoxX, dialogBoxY, "Dialog", DialogBox, {phrases: phrases});
}

/// @instancevar {Array<Array<String>>} phrasesNice1;
self.phrasesSerious = 
[
    [
        "Hey you! What are you doing here?!", 
        "This is my island. Who let you on here?", 
        "Since you seem nice enough, even though you aren't answering me, I could put you to work.", "There's a tall tale about some mystical piece of paper in a bottle around these isles, do you know anything about it?"
    ],
    [
        "I saw what you did with the lighthouse! Good work! Kind of hurt you didn't come to me first though with your findings on the magic. Maybe this time you could?",
        "I found after some very thorough research and ethically questionable actions, that the maps are in fact connected to a very ancient warlock who used to live here. He was practicing some form of dark magic, it took a LOT of digging...literally.",
        "Anyways...Next time you stumble upon one of those bottles, you let me know."
    ],
    [
        "Hey you! Any luck with your search for the bottles? I still haven't found any with my luck of the draw, but I'll keep on tryin.",
        "*You give him a bottle you found earlier with nonsense scribbled on it*",
        "Wait...What's this?",
        "For me? ...You're kidding...",    
        "I CAN FINALLY DIE IN PEACE! THANK YOU! NOW TO USE THAT GRIMOIRE I'VE BEEN STUDYING!"
    ]
];

/// @instancevar {Array<Array<String>>} phrasesAngry; 
self.phrasesAngry = 
[
    [
        "This storm has totally ruined my day of doing absolutely nothing. How am I supposed to brood in peace now?",
        "Oh. Hi.",
        "Who are you?",
        "I don't want to hear what you have to say.",
        "Why are you just standing there...ominously...",
        "Well, if you're not going to leave me alone, rumor has it there's a magical piece of paper on one of these islands. I don't believe any of that voodoo hoodoo crap though. Never helped me. Never will.",
        "Now, get out of my face before I go find a palm to hit you with." 
    ],
    [
        "Oh. It's you again. Go do whatever you need to do, I can't be bothered.",
        "I've already missed my 4 o' clock sitting session because of you, so I can't be bothered to talk to you anymore.",
        "Oh look, there he goes, lighting up another lighthouse. Like we needed help with that anyway..."
    ],
    [
        "What do you want.",
        "...",
        "You know, you actually aren't half bad. I can actually go see my mom now...",
        "Thanks kid."
    ]
];

/// @instancevar {Array<Array<String>>} phrasesAngry; 
self.phrasesCheery = 
[
    [
        "Hey Stranger! Come on over!",
        "What brings you into town? I don't recognize ya!",
        "Hm..A quiet one huh?",
        "Well, don't worry about it! My uncle is the same way , so I'm totally used to it. Don't stress about needing to say anything. I can go on for hours.",
        "APPARENTLY, there's this crazy legend about these bottles around town? I don't know, I just use them to hold sand and gift them to strangers. People call me weird or crazy, but I think it's a sweet gift. Lemme know if you find any!",
        "See you around!"
    ],
    [
        "Hey stranger! Good to see you again!",
        "Any luck with those bottles? Actually, never mind you don't have to answer that.",
        "Anyways, listen to this. I sailed on over to the mainland in my time apart from you, and I heard about this crazy animal you might want to see! Check this out! *Reaches into his pocket*",
        "*Pulls out Hermit Crab*",
        "It's a little crab! I've named him Fred. Fred doesn't have a home yet, but I'm on the hunt for one.",
        "I think one of those bottles would be perfect, but I can't find any...Anyways, I'll see you around"
    ],
    [
        "Hey Friend!",
        "I'm so glad I ran into you! I was wondering if you have any of those bottles laying around!",
        "After you left, I saw you sailing around and figured you've picked up random things in your journeys! Any luck in finding any empty ones?",
        "*You give him an empty bottle with a little left over sand and seaweed lodged inside...*",
        "Thank you so much!!! Fred! You have a home!"
    ]
];

// if (self.mood == "serious")
// {
//     object_set_sprite(self.id, SeriousNPC);
// }
// else if (self.mood == "cheery")
// {
//     object_set_sprite(self.id, CheeryNPC);
// }
// else if (self.mood == "angry")
// {
//     object_set_sprite(self.id, AngryNPC);
// }

