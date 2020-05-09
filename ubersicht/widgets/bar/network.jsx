const command = 'bash bar/scripts/network'
const refreshFrequency = 5000

const render = ({output}) => (
  <div class="screen">
    <div class="network">{`${output}`}</div>
  </div>
)

export {command, refreshFrequency, render}
