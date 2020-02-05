
import macros, dom, jsffi

when not defined(js):
  {.error: "ProppyJS.nim is only available for the JS target" .}

type
  Provider = JsObject
  Observer = JsObject
  Prop = JsObject
  State = JsObject
  Action = JsObject

var ProppyRx {.importjs nodecl.}

proc withProps*(props: seq[Prop])
proc withProps*((currentProps: seq[Prop], providers: seq[Provider]) => props)

proc withState*(stateName: cstring, setterName: cstring, initialState: auto)
proc compose*(factories: varargs[auto]): auto
proc withReducer*(stateName: cstring, dispatcherName: cstring, reducer: proc((state: State, action: Action): State), initialState: auto): auto
proc withHandlers*(handlers: JsObject): auto
proc withStateHandlers*(initialState: auto, handlers: JsObject): auto
proc withObservable*((props: seq[Prop], providers: seq[Provider]): Observable
proc withTimer(timer: cint, props: seq[Prop])
proc withTimer(timer: cint, (props: seq[Prop], providers: seq[Provider]) => props)
proc onChange(propName: cstring, (prop: Prop, providers: seq[Provider]) => props)
proc onChange( (prevProps: seq[Prop], nextProps: seq[Prop]) => true, (props, providers) => props )
proc onChange( propName: cstring, (props: seq[Prop], providers, cb) => void )
proc map(proc(props: seq[Prop], providers) => props)
proc shouldUpdate((prevProps: seq[Prop], nextProps: seq[Prop], providers: seq[Provider]) => true)
proc didSubscribe((props: seq[Prop], providers: seq[Provider]) => {})
proc willDestroy((props: seq[Prop], providers: seq[Provider]) => {})
proc emit((cb: auto, props: seq[Prop], providers: seq[Provider]) => {})
proc handleReceivedProps(on: bool): auto
proc handleReceivedProps(proc(receivedProps: seq[Prop]): JsObject)
proc create(options: JsObject): auto
