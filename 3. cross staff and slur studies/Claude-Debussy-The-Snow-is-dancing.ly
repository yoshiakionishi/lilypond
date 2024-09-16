\version "2.24.4"
\language "english"

%{
Music I based this typesetting on is found here:

https://imslp.eu/files/imglnks/euimg/b/b1/IMSLP931673-PMLP2387-Debussy_Children%27s_Corner_Henle.pdf

This is an exercise that addresses:
- cross staff in keyboard writing
- shifting notes horizontally
- slur across staffs
- - - Instead of slurring from mm. 2 to 6, I divided up the slur into
smaller segments, treating them separately as I tweaked them. It was not
possible to adjust one large slur spanning more than two staves per staff,
and I believe this is a workaround specific to notesetting..
- control over markups
- how to handle fitting a specific number of measures per system. (use of an invisible
variable with \break function)

%}


\header {
  title = "The Snow is dancing"
  subtitle = \markup {from: \italic Children‘s \italic Corner}
  composer = "Claude Debussy"
}

global =
{
  \numericTimeSignature
  \key d \minor
  \tempo "Modérémemt animé"
}

lh = {
  \change Staff = "left"
}

rh = {
  \change Staff = "right"
}

eeffggaaSlurBegins =
{
  \lh e'16(-.[ \rh e''-.
  \lh f'-. \rh f''-.
  \lh g'-. \rh g''-.
  \lh a'-. \rh a''-.]
}

eeffggaa =
{
  \lh e'16-.[ \rh e''-.
  \lh f'-. \rh f''-.
  \lh g'-. \rh g''-.
  \lh a'-. \rh a''-.]
}

eeffggaaSlurEnds =
{
  \lh e'16-.[ \rh e''-.
  \lh f'-. \rh f''-.
  \lh g'-. \rh g''-.
  \lh a'-. \rh a'')-.]
}
right =

{
  \global

  e''8-.(\pp f''-._\markup \italic \small "doux et estompé"
  g''-. a''-.
  e''-. f''-.
  g''-. a''-.) | %1

  \shape #'(
             (( 0 . -2) (0 . 4) (5 . 0) (1.75 . 0.25))
             ) Slur
  \eeffggaaSlurBegins \eeffggaa | %2
  \eeffggaa \eeffggaaSlurEnds  | %3

  \shape #'(
             (( -3 . -0) (0 . 0) (0 . 0) (2 . 0))
             ) Slur

  \eeffggaaSlurBegins \eeffggaa | %4
  \eeffggaa \eeffggaaSlurEnds | %5

  \shape #'(
             (( -3 . -0) (0 . 0) (0 . 0) (0 . 0))
             ) Slur

  \eeffggaaSlurBegins \eeffggaaSlurEnds  %6

  \shape #'(
             (( 0 . -2) (0 . 4) (5 . 0) (2 . 0.25))
             ) Slur

  \once \override Beam.positions = #'(4 . 5)
  \shiftOn
  \lh d''16-.([ \rh e''-.
  \lh c''-. \rh f''-.
  \lh bf'-. \rh g''-.
  \lh a'-. \rh a''-.]
  \lh c''16-.[ \rh d''-.
  \lh bf'-. \rh e''-.
  \lh a'-. \rh f''-.
  \lh g'-. \rh g'')-.] | %7

  \shape #'(
             (( -3 . 0) (-2 . 2) (2 . -1) (2 . -3))
             ) Slur

  \lh d''16-.([ \rh e''-.
  \lh c''-. \rh f''-.
  \lh bf'-. \rh g''-.
  \lh a'-. \rh a''-.]
  \lh c''16-.[ \rh d''-.
  \lh bf'-. \rh e''-.
  \lh a'-. \rh f''-.
  \lh g'-. \rh g''-.] | %8

  \lh a'16-. [ \rh e''-.
  \lh c''-. \rh f''-.
  \lh bf'-. \rh d''-.
  \lh g'-. \rh e''-.
  \lh a'-. \rh c''-.
  \lh f'-. \rh d''-.
  \lh g'-. \rh bf'-.
  \lh e'-. \rh c'')-.] | %9

  \lh a'16(-. [ \rh e''-.
  \lh c''-. \rh f''-.
  \lh bf'-. \rh d''-.
  \lh g'-. \rh e''-.
  \lh a'-. \rh c''-.
  \lh f'-. \rh d''-.
  \lh a'-. \rh e''-.
  \lh d''-. \rh f'')-.] | %10

  \repeat unfold 2 {
    \shape #'(
               ((0 . -3)(-1 . 2)(0 . 2)(0 . 0))
               ) Slur
    \once \override Beam.positions = #'(5.5 . 6.5)
    \stemUp  \lh cs''(-. \stemDown \rh f''-.
    \stemUp  \lh a''-. \stemDown \rh e'')-.
  }
  \repeat unfold 2 {
    \shape #'(
               ((0 . -3)(-1 . 2)(0 . 2)(0 . 0))
               ) Slur
    \once \override Beam.positions = #'(5.5 . 6.5)
    \stemUp \lh cs''(-. \stemDown \rh f''-.
    \stemUp \lh g''-.  \stemDown\rh e'')-.
  }
  | %10
}

left =
{
  \global
  R1 |
  s1 |
  \override NoteColumn.force-hshift = #-0.4
  bf'1---^ ^\markup {\musicglyph #"p"} |
  c''---^ ^\markup {\musicglyph #"p"}  |
  bf'---^ ^\markup {\musicglyph #"p"} |
  cs''---^ ^\markup {\musicglyph #"p"} |
  \override NoteColumn.force-hshift = #0.35
  d'-- ^\markup {
    \translate #'(-2.5 . 2.5) \whiteout \small \italic più \translate #'(-2.5 . 2.5)
    \dynamic pp
  } |
  d'-- |
  d'-- |
  d'-- |
  s1
}

pagebreakchart =
{
  \new Voice {
    s1*3 \break
    s1*2 \break
    s1*2 \break
    s1*2 \break
    s1*2 \break
  }
}


\score {
  \layout {
    \context{
      \PianoStaff
      \consists "Span_stem_engraver"
    }
  }
  \new PianoStaff
  \with { instrumentName = \markup { \hspace #4 \huge \bold \abs-fontsize #18 "4."} }
  <<
    \new Staff = "right" \right
    \new Staff = "left" << \left \pagebreakchart >>

  >>

}