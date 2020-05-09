const command = 'bash bar/scripts/ws'
const refreshFrequency = 1000

const render = ({output}) => (
  <div class="screen">
    <div class="workspace">{`${output}`}</div>
  </div>
)

export {command, refreshFrequency, render}
