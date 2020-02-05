import macros, dom, jsffi

type
  PropFactory
  ReactComponent

var ProppyProvider
# Higher-order component for attaching your Proppy factory to your Component
proc attach*(propFactory: PropFactory, component: ReactComponent): auto
