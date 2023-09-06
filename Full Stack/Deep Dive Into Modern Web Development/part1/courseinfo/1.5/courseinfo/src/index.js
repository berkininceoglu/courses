import React from 'react'
import ReactDOM from 'react-dom'

const App = () => {
  const course = {
  name : 'Half Stack application development',
  parts: [  
  {
    name: 'Fundamentals of React',
    exercises: 10
  },
  {
    name: 'Using props to pass data',
    exercises: 7
  },
  {
    name: 'State of a component',
    exercises: 14
  }]
}
  return (
    <div>
      <Header name={course.name} />
      <Content object={course}/>
      <Total object={course}/>
    </div>
  )
}

const Header = (param) => {
    return (<h1>{param.name}</h1>)
}
const Content = (param) => {
    console.log(param.object.parts)
    return (
      <div>
       <Part name={param.object.parts[0].name} count={param.object.parts[0].exercises}/>
       <Part name={param.object.parts[1].name} count={param.object.parts[1].exercises}/>
       <Part name={param.object.parts[2].name} count={param.object.parts[2].exercises}/>
      </div>

    )
}
const Total = (param) => {
    return (<p>Number of exercises {param.object.parts[0].exercises+param.object.parts[1].exercises+param.object.parts[2].exercises}</p>)
}

const Part = (param) => {
  return (<p> {param.name} {param.count} </p>)
}

ReactDOM.render(<App />, document.getElementById('root'))