import {run} from 'uebersicht'

const command = 'bash bar/scripts/network'
const refreshFrequency = 15000

const render = ({output}) => (
  <div
    className="screen"
    onClick={() =>
      run('open /System/Library/PreferencePanes/Network.prefPane/')
    }
  >
    <div className="network">{output}</div>
  </div>
)

export {command, refreshFrequency, render}
