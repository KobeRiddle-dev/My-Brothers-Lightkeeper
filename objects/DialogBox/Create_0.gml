/// @description Insert description here
// You can write your code in this editor

self.depth = -2048;

Update = function()
{
    if (IsInteractInputDown())
    {
        self.AdvanceDialog();
        return;
    }

    if (IsBackInputDown())
    {
        self.RevertDialog();
        return;
    }
}

AdvanceDialog = function()
{
    self.currentPhraseIndex++;
    if (self.currentPhraseIndex >= array_length(self.phrasesNice1))
    {
        EndDialog();      
        return;
    }
}

RevertDialog = function()
{
    self.currentPhraseIndex--;
    if (self.currentPhraseIndex < 0)
    {
        EndDialog();
        return;
    }   
}

EndDialog = function()
{
    global.dialogMode = false;
    instance_destroy(self.id);
}

/// @param {Real} phraseIndex 
DrawPhrase = function(phraseIndex)
{
    show_debug_message("Drawing text: " + self.phrasesNice1[phraseIndex]);
    draw_set_font(DialogFont);
    draw_text_ext_color(self.x - (self.sprite_width / 2) + 32, self.y - (self.sprite_height / 2) + 32, self.phrasesNice1[phraseIndex], -1, self.sprite_width - 64, c_white, c_white, c_white, c_white, 1);
}

/// @instancevar {Array<Array<String>>} phrasesNice1;
self.phrasesNice = 
[
    ["Hey you! What are you doing here?!", 
    "This is my island. Who let you on here?", 
    "Since you seem nice enough, even though you aren't answering me, I could put you to work.", "There's a tall tale about some mystical piece of paper in a bottle around these isles, do you know anything about it?"
    ],
];

/// @instancevar {Array<String>} phrasesMean; 
self.phrasesMean = ["Oh. It's you again. Go do whatever you need to do, I can't be bothered.", "I've already missed my 4 o' clock sitting session because of you, so I can't be bothered to talk to you anymore.", "Oh look, there hes goes, lighting up another lighthouse. Like we needed help with that anyway..."]

self.currentPhraseIndex = 0;

self.DrawPhrase(0);

