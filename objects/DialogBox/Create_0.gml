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
    if (self.currentPhraseIndex >= array_length(self.phrases) || self.currentPhraseIndex < 0)
    {
        EndDialog();      
        return;
    }
}

RevertDialog = function()
{
    self.currentPhraseIndex--;
    if (self.currentPhraseIndex < 0 >= array_length(self.phrases))
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
    // show_debug_message("Drawing text: " + self.phrases[phraseIndex]);
    draw_set_font(DialogFont);
    draw_text_ext_color(self.x - (self.sprite_width / 2) + 32, self.y - (self.sprite_height / 2) + 32, self.phrases[phraseIndex], -1, self.sprite_width - 64, c_white, c_white, c_white, c_white, 1);
}

self.currentPhraseIndex = 0;

// self.DrawPhrase(0);

/// @instancevar {Array<String} phrases;  

