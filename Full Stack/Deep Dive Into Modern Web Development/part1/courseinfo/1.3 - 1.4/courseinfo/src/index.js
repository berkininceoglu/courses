import React from 'react'
import ReactDOM from 'react-dom'

const App = () => {
  const course = 'Half Stack application development'
  const course1= {
    name: 'Fundamentals of React',
    exercises: 10
  }
  const course2= {
    name: 'Using props to pass data',
    exercises: 7
  }
  const course3= {
    name: 'State of a component',
    exercises: 14
  }

  const parts = [course1,course2,course3]


  return (
    <div>
      <Header name={course} />
      <Content array={parts}/>
      <Total total={parts}/>
    </div>
  )
}

const Header = (param) => {
    return (<h1>{param.name}</h1>)
}
const Content = (param) => {
  console.log(param.array[1].name)
    return (
      <div>
       <Part name={param.array[0].name} count={param.array[0].exercises}/>
       <Part name={param.array[1].name} count={param.array[1].exercises}/>
       <Part name={param.array[2].name} count={param.array[2].exercises}/>
      </div>

    )
}
const Total = (param) => {
    return (<p>Number of exercises {param.total[0].exercises+param.total[1].exercises+param.total[2].exercises}</p>)
}

const Part = (param) => {
  return (<p> {param.name} {param.count} </p>)
}

ReactDOM.render(<App />, document.getElementById('root'))