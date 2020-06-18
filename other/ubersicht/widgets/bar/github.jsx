const SECRETS = require('./secrets.json')

import { run } from 'uebersicht'

export const command =
  `curl -s --user ${SECRETS.user}:${SECRETS.apiKey} -s https://api.github.com/notifications?participating=true`
export const refreshFrequency = 1000000

export const render = ({ output }) => {
  let data
  let totalNotifications = 0

  try {
    data = JSON.parse(output)
  } catch (e) {
    console.log(e)
  }

  if (!data) return <div className="gh">loading...</div>

  return <div className="gh" onClick={() => run('open https://github.com/notifications')}>
    {
      data ?
        <span className="gh-notifs">[gh] {data.length}</span>
        : null
    }
  </div >
}
