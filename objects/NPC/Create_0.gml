/// @description Insert description here
// You can write your code in this editor

Update = function()
{
}

CreateDialog = function()
{
    var camera = view_camera[0];

    var dialogBoxX = self.x; //camera_get_view_x(camera) + (display_get_width());
    var dialogBoxY = self.y; //camera_get_view_y(camera) + display_get_height();

    show_debug_message("Creating dialog at x:" + string(dialogBoxX) + " y: " + string(dialogBoxY));

    var phrases = [];

    if (self.mood == "serious")
    {
        phrases = self.phrasesSerious[self.phraseSet];
    }
    else if (self.mood == "cheery")
    {
        phrases = self.phrasesSerious[self.phraseSet];
    }
    else if (self.mood == "angry")
    {
        phrases = self.phrasesSerious[self.phraseSet];
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
    ]
];

/// @instancevar {Array<Array<String>>} phrasesAngry; 
self.phrasesAngry = 
[
    [
        "This storm has totally ruined my day of doing absolutely nothing. How am I supposed to brood in peace now?",
        "Oh. Hi.",
        "Who are you?",
        "I don’t want to hear what you have to say.",
        "Why are you just standing there...ominously...",
        "Well, if you're not going to leave me alone, rumor has it there’s a magical piece of paper on one of these islands. I don't believe any of that voodoo hoodoo crap though. Never helped me. Never will.",
        "Now, get out of my face before I go find a palm to hit you with." 
    ],
    [
        "Oh. It’s you again. Go do whatever you need to do, I can’t be bothered.",
        "I’ve already missed my 4 o’ clock sitting session because of you, so I can’t be bothered to talk to you anymore.",
        "Oh look, there he goes, lighting up another lighthouse. Like we needed help with that anyway..."
    ],
    [
        "What do you want.",
        "...",
        "You know, you actually aren’t half bad. I can actually go see my mom now...",
        "Thanks kid."
    ]
];

/// @instancevar {Array<Array<String>>} phrasesAngry; 
self.phrasesCheery = 
[
];

/// @instancevar {String} 
self.mood = "none";  

/// @instancevar {Real} phraseSet; 
self.phraseSet = 0;