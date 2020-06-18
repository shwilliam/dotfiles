export const command =
  'ESC=`printf "e"`; ps -A -o %mem | awk \'{s+=$1} END {print "" s}\''
export const refreshFrequency = 60000
export const initialState = '🤷‍♀️'

export const updateState = event => {
  const mem = parseInt(event.output)
  const memval = mem.toString().padStart(2, '0')

  if (mem <= 99) return memval
  else return '🤷‍♀️'
}

export const render = output => (
  <div className="screen">
    <div className="mem">[mem] {output}%</div>
  </div>
)
