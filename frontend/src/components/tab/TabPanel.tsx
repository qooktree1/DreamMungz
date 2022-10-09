interface TabPanelProp {
  children?: JSX.Element
}

const TabPanel = ({ children }: TabPanelProp) => {
  return (
    <div className="flex items-center justify-center w-full h-full p-5 rounded-b-lg rounded-tr-lg shadow-lg bg-beige">
      {children}
    </div>
  )
}

export default TabPanel
