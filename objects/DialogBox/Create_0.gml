/// @description Insert description here
// You can write your code in this editor



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
    if (self.currentPhraseIndex >= array_length(self.phrases))
    {
        EndDialog();      
        return;
    }
    self.DrawPhrase(currentPhraseIndex);
}

RevertDialog = function()
{
    self.currentPhraseIndex--;
    if (self.currentPhraseIndex < 0)
    {
        EndDialog();
        return;
    }   
     self.DrawPhrase(currentPhraseIndex);
}

EndDialog = function()
{
    global.dialogMode = false;
    instance_destroy(self.id);
}

/// @param {Real} phraseIndex 
DrawPhrase = function(phraseIndex)
{
    show_debug_message("Drawing text: " + self.phrases[phraseIndex]);
    draw_set_font(DialogFont);
    draw_text_ext(self.x, self.y, self.phrases[phraseIndex], self.sprite_width - 10);
}

/// @instancevar {Array<String>} phrases;
self.phrases = ["Hey you! What are you doing here?!", "This is my island. Who let you on here?", "Since you seem nice enough, even though you aren’t answering me, I could put you to work.", "There’s a tall tale about some mystical piece of paper in a bottle around these isles, do you know anything about it?"];

self.currentPhraseIndex = 0;

self.DrawPhrase(0);

