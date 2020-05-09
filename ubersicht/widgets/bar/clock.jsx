const command = 'date +"%A, %b %d at %H:%M"'
const refreshFrequency = 60000

const render = ({output}) => (
  <div class="screen">
    <div class="holder">
      <div class="clock">{`${output}`}</div>
    </div>
  </div>
)

export {command, refreshFrequency, render}
