import { RecoilRoot } from "recoil"
import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom"
import ReactDOM from "react-dom/client"
import { QueryClient, QueryClientProvider } from "@tanstack/react-query"
import { ReactQueryDevtools } from "@tanstack/react-query-devtools"

import "./index.css"
import App from "./App"
import "tw-elements"
import ReactGA from "react-ga"

const TRACKING_ID = process.env.REACT_APP_GOOGLE_ANALYTICS_TRACKING_ID
ReactGA.initialize(TRACKING_ID!)
const queryClient = new QueryClient()

const root = ReactDOM.createRoot(document.getElementById("root") as HTMLElement)

root.render(
  <RecoilRoot>
    <QueryClientProvider client={queryClient}>
      <BrowserRouter>
        <App />
        {/* <ReactQueryDevtools initialIsOpen={false} /> */}
      </BrowserRouter>
    </QueryClientProvider>
  </RecoilRoot>
)
