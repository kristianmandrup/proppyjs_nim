import macros, dom, jsffi

proc withStream*(proc(props$: Observable, providers: seqq[auto]): Observable): auto
proc from*(propInstance: Prop): auto