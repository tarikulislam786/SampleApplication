(function ($) {
    "use strict";

    $(".mat-inp input").focus(function () {
        $(this).parent().addClass("is-active is-completed");
    });
    $(".mat-inp input").focusout(function () {
        if ($(this).val() === "")
            $(this).parent().removeClass("is-active is-completed");
    })
    $(".mat-inp input").each(function() {
        if ($(this).val() === "") {

        } else {
            $(this).parent().addClass("is-active is-completed");
        }
    });

    $('.button, .btn-circle, .side-menu ul li a, .mat-table > tbody > tr > td a').mousedown(function (e) {
       // debugger;
        var target = e.target;
        var rect = target.getBoundingClientRect();
        var ripple = target.querySelector('.ripple');
        $(ripple).remove();
        ripple = document.createElement('span');
        ripple.className = 'ripple';
        ripple.style.height = ripple.style.width = Math.max(rect.width, rect.height) + 'px';
        target.appendChild(ripple);
        var top = e.pageY - rect.top - ripple.offsetHeight / 2 - document.body.scrollTop;
        var left = e.pageX - rect.left - ripple.offsetWidth / 2 - document.body.scrollLeft;
        ripple.style.top = top + 'px';
        ripple.style.left = left + 'px';
        return false;
    });

    var app = angular.module("myApp", ["rmDatepicker"]);

    app.config(["rmDatepickerConfig", function (rmDatepickerConfig) {
        rmDatepickerConfig.mondayStart = true;
        rmDatepickerConfig.initState = "month";
    }]);

    (function () {
        var app = angular.module("myApp");

        var MyCtrl = function ($scope) {

            /* Datepicker local configuration */
            $scope.rmConfig1 = {
                mondayStart: false,
                initState: "month", /* decade || year || month */
                maxState: null,
                minState: "month",
                decadeSize: 12,
                monthSize: 42, /* "auto" || fixed nr. (35 or 42) */
                min: new Date('2000-11-21'),
                max: new Date('2023-11-21'),
                format: "yyyy-MM-dd"
            };

            $scope.rmConfig2 = { format: "d MMM yyyy" };

            $scope.oDate1 = new Date('2015-12-12');
            $scope.oDate2 = new Date();
        };
        app.controller("MyCtrl", ['$scope', MyCtrl]);
    }());

    var inputElements = document.getElementsByTagName("input");
    var i;
        for (i=0; inputElements[i]; i++) {
            if (inputElements[i].className && (inputElements[i].className.indexOf("disableAutoComplete") != -1)) {
                inputElements[i].setAttribute("autocomplete","off");
            }
        }
})(jQuery);