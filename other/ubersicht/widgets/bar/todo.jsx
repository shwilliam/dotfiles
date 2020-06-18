const command = `cat ~/todo.json` // @shwilliam/todo-cli
const refreshFrequency = 20000 // ms

const render = ({ output }) => {
  const todos = output ? [{ title: '🌈' }, ...JSON.parse(output)] : []

  if (!todos) return <div className="todos">loading...</div>
  return (
    <div className="screen">
      <div className="holder -fullheight">
        <marquee scrollamount="1" scrolldelay="60" className="todos-marquee">{[...todos, ...todos, ...todos, ...todos].map(({ title, done }, i) => (
          <span key={i}>
            <span style={{ textDecoration: done ? 'line-through' : '' }}>{title}</span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          </span>
        ))}
        </marquee>
        {/* <ul className="todos">{todos.map(({ title, done }, i) => (
          <li key={i} style={{ textDecoration: done ? 'line-through' : '' }}>{title}</li>
        ))}
        </ul> */}
      </div>
    </div>
  )
}

export { command, refreshFrequency, render }
