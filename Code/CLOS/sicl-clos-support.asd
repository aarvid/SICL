(cl:in-package #:asdf-user)

(defsystem :sicl-clos-support
  :depends-on (:sicl-clos-package
	       :sicl-global-environment)
  :serial t
  :components
  ((:file "ensure-generic-function-using-class-support")
   (:file "make-method-lambda-support")
   (:file "make-method-lambda-defgenerics")
   (:file "make-method-lambda-defmethods")
   (:file "defmethod-support")
   (:file "ensure-method")))
