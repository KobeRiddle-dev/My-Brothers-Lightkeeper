/// @description Insert description here
// You can write your code in this editor

Update = function()
{
    if (IsInteractInputDown)
    {
        self.AdvanceDialog();
        return;
    }

    if (IsBackButtonDown)
    {
        self.RevertDialog();
    }
}

AdvanceDialog = function()
{
    self.currentPhraseIndex++;
    self.DrawPhrase(currentPhraseIndex);
}

RevertDialog = function()
{
    self.currentPhraseIndex--;
    self.DrawPhrase(currentPhraseIndex);
}

/// @param {Real} phraseIndex 
DrawPhrase = function(phraseIndex)
{
    show_debug_message("Drawing text: " + self.phrases[phraseIndex]);
    draw_text(self.x, self.y, self.phrases[phraseIndex]);
}

/// @instancevar {Array<String>} phrases;
self.currentPhraseIndex = 0;

self.DrawPhrase(0);

