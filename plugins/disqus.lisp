(defpackage :coleslaw-disqus
  (:use :cl :coleslaw))

(in-package :coleslaw-disqus)

;; Should be added to plugins like so:
; :plugins (mathjax (disqus :shortname "mysite-disqus-shortname"))

(defvar *disqus-header*
  "<div id=\"disqus_thread\"></div>
     <script type=\"text/javascript\">
       /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
       var disqus_shortname = '~a';
       /* * * DON'T EDIT BELOW THIS LINE * * */
       (function() {
         var dsq = document.createElement('script');
         dsq.type = 'text/javascript';
         dsq.async = true;
         dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
         (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
           })();
     </script>
     <noscript>Please enable JavaScript to view the <a href=\"http://disqus.com/?ref_noscript\">comments powered by Disqus.</a></noscript>
     <a href=\"http://disqus.com\" class=\"dsq-brlink\">comments powered by <span class=\"logo-disqus\">Disqus</span></a>")

(defun enable (&key shortname)
  (coleslaw:add-injection (format nil *disqus-header* shortname) :head))
