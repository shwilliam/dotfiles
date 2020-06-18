const command = 'bash bar/scripts/battery'
const refreshFrequency = 60000

const render = ({output}) => (
  <div class="screen">
    <div class="battery">[battery] {output}</div>
  </div>
)

export {command, refreshFrequency, render}
