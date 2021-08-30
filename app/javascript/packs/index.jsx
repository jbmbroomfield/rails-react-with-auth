import React from 'react'
import ReactDOM from 'react-dom'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <div>
      <h1>Hello World.</h1>
    </div>,
    document.body.appendChild(document.createElement('div')),
  )
})
