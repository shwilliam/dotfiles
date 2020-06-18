const command = 'date +"%A, %b %d at %H:%M"'
const refreshFrequency = 60000

const render = ({output}) => (
  <div className="screen">
    <div className="holder">
      <div className="clock">{`${output}`}</div>
    </div>
  </div>
)

export {command, refreshFrequency, render}
