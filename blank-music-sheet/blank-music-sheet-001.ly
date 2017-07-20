%% blank-music-sheet-001.ly

     \layout{ indent = #0 }
     emptymusic = {
       \repeat unfold 8 % Change this for more lines.
       { s1\break }
       \bar "|."
     }
     \new Score \with {
       \override TimeSignature #'transparent = ##t
     % un-comment this line if desired
     %  \override Clef #'transparent = ##t
       defaultBarType = #""
       \remove Bar_number_engraver
     } <<
     
     % modify these to get the staves you want
       \new Staff \emptymusic
       \new TabStaff \emptymusic
     >>

    \header {
      tagline = ""  % removed
    } 

%% *EOF*
