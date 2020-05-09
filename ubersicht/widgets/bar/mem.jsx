export const command =
  'ESC=`printf "e"`; ps -A -o %mem | awk \'{s+=$1} END {print "" s}\''
export const refreshFrequency = 30000
export const initialState = '💾 🤷‍♀️'

export const updateState = event => {
  const mem = parseInt(event.output)
  const memval = mem.toString().padStart(2, '0')

  if (mem <= 80) return `💾 ${memval}`
  else return '💾 🤷‍♀️'
}

export const render = output => (
  <div class="screen">
    <div class="mem">{output}</div>
  </div>
)
