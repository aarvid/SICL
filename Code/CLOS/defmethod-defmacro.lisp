(cl:in-package #:sicl-clos)

(defmacro defmethod (&environment env function-name &rest rest)
  (multiple-value-bind
	(qualifiers lambda-list specializers declarations documentation forms)
      (parse-defmethod rest)
    (let ((generic-function-var (gensym)))
      `(let ((,generic-function-var
	       (ensure-generic-function ',function-name :environment ,env)))
	 (ensure-method
	  ,generic-function-var
	  ,env
	  :lambda-list ',lambda-list
	  :qualifiers ',qualifiers
	  :specializers ,(canonicalize-specializers specializers)
	  :documentation ,documentation
	  :function
	  ,(make-method-lambda
	    ;; FIXME: do this better.
	    (class-prototype
	     (sicl-environment:find-class 'standard-generic-function env))
	    (class-prototype
	     (sicl-environment:find-class 'standard-method env))
	    `(lambda ,lambda-list
	       ,@declarations
	       ,@forms)
	    nil))))))
