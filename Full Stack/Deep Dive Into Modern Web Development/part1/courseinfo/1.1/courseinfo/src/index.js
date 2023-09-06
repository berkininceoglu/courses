import React from 'react'
import ReactDOM from 'react-dom'

const App = () => {
  const course = 'Half Stack application development'
  const part1 = 'Fundamentals of React'
  const exercises1 = 10
  const part2 = 'Using props to pass data'
  const exercises2 = 7
  const part3 = 'State of a component'
  const exercises3 = 14

  return (
    <div>
      <Header name={course} />
      <Content name={part1} count={exercises1}/>
      <Content name={part2} count={exercises2}/>
      <Content name={part3} count={exercises3}/>
      <Total total={exercises1+exercises2+exercises3}/>
    </div>
  )
}

const Header = (param) => {
    return (<h1>{param.name}</h1>)
}
const Content = (param) => {
    return (
    <p> {param.name} {param.count}</p>
    )
}
const Total = (param) => {
    return (<p>Number of exercises {param.total}</p>)
}

ReactDOM.render(<App />, document.getElementById('root'))