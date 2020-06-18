export const command =
  'ESC=`printf "e"`; ps -A -o %cpu | awk \'{s+=$1} END {printf("%.2f",s/8);}\''
export const refreshFrequency = 60000
export const initialState = '🤷‍♀️'

export const updateState = event => {
  const cpu = parseInt(event.output)
  const cpuval = cpu.toString().padStart(2, '0')

  if (cpu <= 99) return cpuval
  else return '🤷‍♀️'
}

export const render = output => (
  <div className="screen">
    <div className="cpu">[cpu] {output}%</div>
  </div>
)
