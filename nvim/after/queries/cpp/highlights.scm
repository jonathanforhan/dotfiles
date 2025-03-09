;; inherits: cpp
;; extends

;; Match 'auto' as a keyword
((auto) @auto_keyword (#set! priority 130))

((_) @auto_keyword
  (#eq? @auto_keyword "auto"))
