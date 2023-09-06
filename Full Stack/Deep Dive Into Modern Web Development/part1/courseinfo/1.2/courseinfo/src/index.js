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
  const parts = [part1,part2,part3]
  const exercises =[exercises1,exercises2,exercises3]
  return (
    <div>
      <Header name={course} />
      <Content parts={parts} exercises={exercises}/>
      <Total total={exercises1+exercises2+exercises3}/>
    </div>
  )
}

const Header = (param) => {
    return (<h1>{param.name}</h1>)
}
const Content = (param) => {
    return (
      <div>
       <Part name={param.parts[0]} count={param.exercises[0]}/>
      <Part name={param.parts[1]} count={param.exercises[1]}/>
      <Part name={param.parts[2]} count={param.exercises[2]}/>
      </div>

    )
}
const Total = (param) => {
    return (<p>Number of exercises {param.total}</p>)
}

const Part = (param) => {
  return (<p> {param.name} {param.count} </p>)
}

ReactDOM.render(<App />, document.getElementById('root'))