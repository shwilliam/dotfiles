# from ohmyzsh default plugins
# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/emoji-clock/emoji-clock.plugin.zsh

function emoji-clock() {
  # Add 15 minutes to the current time and save the value as $minutes.
  (( minutes = $(date '+%M') + 15 ))
  (( hour = $(date '+%I') + minutes / 60 ))
  # make sure minutes and hours don't exceed 60 nor 12 respectively
  (( minutes %= 60 )); (( hour %= 12 ))

  case $hour in
     0) clock="🕛"; [ $minutes -ge 30 ] && clock="🕧";;
     1) clock="🕐"; [ $minutes -ge 30 ] && clock="🕜";;
     2) clock="🕑"; [ $minutes -ge 30 ] && clock="🕝";;
     3) clock="🕒"; [ $minutes -ge 30 ] && clock="🕞";;
     4) clock="🕓"; [ $minutes -ge 30 ] && clock="🕟";;
     5) clock="🕔"; [ $minutes -ge 30 ] && clock="🕠";;
     6) clock="🕕"; [ $minutes -ge 30 ] && clock="🕡";;
     7) clock="🕖"; [ $minutes -ge 30 ] && clock="🕢";;
     8) clock="🕗"; [ $minutes -ge 30 ] && clock="🕣";;
     9) clock="🕘"; [ $minutes -ge 30 ] && clock="🕤";;
    10) clock="🕙"; [ $minutes -ge 30 ] && clock="🕥";;
    11) clock="🕚"; [ $minutes -ge 30 ] && clock="🕦";;
     *) clock="⌛";;
  esac
  echo $clock
}
