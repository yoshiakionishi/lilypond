\version "2.26.0"

#(define bar-line-colors
  `(("|"     .  ,black)
    ("||"    .  ,red)
    (":|]"   .  ,red)
    ("[|:"   .  ,red)
    ("|."    .  ,red)
    (".|:"   .  ,red)
    (":|."   .  ,red)
    ))

#(define (color-barline-stencil grob)
  (let* ((glyph (ly:grob-property grob 'glyph))
         (colour (assoc-ref bar-line-colors glyph)))
   (ly:grob-set-property! grob 'color (or colour black))
   (ly:bar-line::print grob)))

ColorRepeatSomeBarsBeg = {
 % ColorRepeatAFewBarsStart - Override the barline colour with magenta
 \once \revert Score.BarLine.stencil
 \once \override Score.BarLine.color = #magenta
 % 'glyph' for start of repeat some bars
 \bar ".|:"
}
ColorRepeatSomeBarsEnd = {
 % ColorRepeatAFewBarsEnd - Override the barline colour with Magenta
 \once \revert Score.BarLine.stencil
 \once \override Score.BarLine.color = #magenta
 % 'glyph' for start of repeat some bars
 \bar ":|."
}
music = \relative c' {
 % Global Settings for Colours - volta brackets color red
 \override Score.VoltaBracket.color = #red
 % Shorten the volta bracket(s) to be drawn (to be over one measure only)
 \override Score.VoltaBracket.musical-length = \musicLength 1
 f1
 % BEG Repeat with different endings - Override the barline colour

 \override Score.BarLine.stencil = #color-barline-stencil

 \repeat volta 2 {
  g1
  \ColorRepeatSomeBarsBeg
  a1 a1
  \ColorRepeatSomeBarsEnd
  b1
 } % END repeat volta 2
 \alternative {
  \volta 1 {
   c1

  } % END volta 1
  \volta 2 {
   d1
  } % END volta 2
 } % END alternative
 e1 \section

 f1 \fine

} % END music \relative c'
\score {
 \music
 \layout {
  \context {
   \Score
   % definition of 'startRepeatBarType'
   startRepeatBarType = "[|:"
   % definition of 'startRepeatBarType'
   endRepeatBarType = ":|]"
  }
 }
}
