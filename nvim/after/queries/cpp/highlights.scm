;; inherits: cpp
;; extends

;; Match 'auto' as a keyword
((auto) @auto_keyword (#set! priority 130))

;; Match 'auto' as a type
((primitive_type) @auto_keyword
  (#eq? @auto_keyword "auto"))

;; Match 'auto' as a type identifier
((type_identifier) @auto_keyword
  (#eq? @auto_keyword "auto"))

;; Match 'auto' as a plain identifier (fallback)
((identifier) @auto_keyword
  (#eq? @auto_keyword "auto"))

;; Match 'auto' in template parameters
(template_argument_list
  ((_) @auto_keyword
    (#eq? @auto_keyword "auto")))

;; Match 'auto' in declarations
(declaration
  ((_) @auto_keyword
    (#eq? @auto_keyword "auto")))

;; Match 'auto' in function parameters
(parameter_declaration
  ((_) @auto_keyword
    (#eq? @auto_keyword "auto")))

;; Additional fallback to catch other contexts
((_) @auto_keyword
  (#eq? @auto_keyword "auto"))
