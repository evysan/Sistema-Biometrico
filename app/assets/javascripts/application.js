// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require_tree .
"use strict";
!function() {
    if ("3000" !== window.location.port) {
        var e = document.querySelectorAll(".navigation .popover-link")
            , t = void 0;
        for (t = 0; t < e.length; t++)
            e[t].href.match(/#/g) && (e[t].href = "http://localhost:3000/#" + e[t].href.split("#")[1])
    }
}(),
    function() {
        function e(e) {
            for (r = 0; r < n.length; r++)
                n[r].classList.remove("popover-open")
        }
        function t(t) {
            t.preventDefault(),
                document.querySelector(this.getAttribute("href")).classList.contains("popover-open") ? document.querySelector(this.getAttribute("href")).classList.remove("popover-open") : (e(),
                    document.querySelector(this.getAttribute("href")).classList.add("popover-open")),
                t.stopImmediatePropagation()
        }
        var o = document.querySelectorAll("[data-popover]")
            , n = document.querySelectorAll(".popover")
            , r = void 0;
        for (r = 0; r < o.length; r++)
            o[r].addEventListener("click", t);
        document.addEventListener("click", e)
    }(),
    function() {
        var e = document.querySelectorAll(".code-content")
            , t = {
            "&": "&amp;",
            "<": "&lt;",
            ">": "&gt;",
            '"': "&quot;",
            "'": "&#39;",
            "/": "&#x2F;"
        }
            , o = void 0;
        for (o = 0; o < e.length; o++)
            e[o].innerHTML = function(e) {
                return String(e).replace(/[&<>"']/g, function(e) {
                    return t[e]
                })
            }(e[o].innerHTML);
        !function(e, t, o, n, r, i) {
            r = t.createElement(o),
                r.async = 1,
                r.src = "https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js",
                i = t.getElementsByTagName(o)[document.querySelectorAll(o).length - 1],
                i.parentNode.insertBefore(r, i)
        }(window, document, "script")
    }();

$('document').ready(function () {
    $('#maintenance-checkbox').on('click', function() {
        $.ajax({
            type: 'POST',
            url: '/maintenance/toggle',
            data: { toggle: $(this).is(':checked') }
        });
    });
});
