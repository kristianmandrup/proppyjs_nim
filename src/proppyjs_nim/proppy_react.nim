import macros, dom, jsffi

when not defined(js):
  {.error: "ProppyJS React.nim is only available for the JS target" .}

type
  PropFactory* = JsObject
  ReactComponent* = JsObject

var ProppyProvider {.importcpp .}

{.push importcpp .}
# Higher-order component for attaching your Proppy factory to your Component
proc attach*(propFactory: PropFactory, component: ReactComponent): auto
{.pop.}