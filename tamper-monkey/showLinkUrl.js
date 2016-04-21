// ==UserScript==
// @name         Vimium external command demo
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Demonstrate Vimium's external commands
// @author       Stephen Blott
// @match        http://*/*
// @grant        none
// ==/UserScript==

// Example Vimium binding:
//   map eu sendMessage hints name=showLinkUrl

(function() {
    'use strict';

    window.addEventListener("message", function(event) {
        if (event.data && event.data.name == "showLinkUrl") {
           var element = document.documentElement.getElementsByTagName("*")[event.data.index];
           alert(element.href);
        }
    });
})();
