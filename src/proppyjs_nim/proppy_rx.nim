import macros, dom, jsffi

when not defined(js):
  {.error: "ProppyJS RxJS.nim is only available for the JS target" .}

proc withStream*(proc(props$: Observable, providers: seqq[auto]): Observable): Observable
proc from*(propInstance: Prop): Observable