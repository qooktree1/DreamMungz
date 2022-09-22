import { RecoilRoot } from "recoil"
import React from "react"
import ReactDOM from "react-dom/client"
import "./index.css"
import App from "./App"
import "tw-elements"

const root = ReactDOM.createRoot(document.getElementById("root") as HTMLElement)
root.render(
  <RecoilRoot>
    <React.StrictMode>
      <App />
    </React.StrictMode>
  </RecoilRoot>
)