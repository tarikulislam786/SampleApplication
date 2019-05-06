HiWork.directive('datepicker', function () {
    return {
        restrict: 'A',
        require: 'ngModel',
        link: function (scope, element, attrs, ngModelCtrl) {
            $(function () {
                element.datepicker({
                    onSelect: function (date) {
                        debugger;
                        scope.$apply(function () {
                            ngModelCtrl.$setViewValue(date);
                        });
                    },
                    dateFormat: 'yy-mm-dd'
                });
            });
        }
    }
});

HiWork.directive('datepickerNoFutureDate', function () {
    return {
        restrict: 'A',
        require: 'ngModel',
        link: function (scope, element, attrs, ngModelCtrl) {
            $(function () {
                element.datepicker({
                    onSelect: function (date) {
                        debugger;
                        scope.$apply(function () {
                            ngModelCtrl.$setViewValue(date);
                        });
                    },
                    dateFormat: 'yy-mm-dd',
                    maxDate: new Date
                });
            });
        }
    }
});

HiWork.directive('datepickerFutureDate', function () {
    return {
        restrict: 'A',
        require: 'ngModel',
        link: function (scope, element, attrs, ngModelCtrl) {
            $(function () {
                element.datepicker({
                    onSelect: function (date) {
                        debugger;
                        scope.$apply(function () {
                            ngModelCtrl.$setViewValue(date);
                        });
                    },
                    dateFormat: 'yy-mm-dd',
                    minDate: new Date
                });
            });
        }
    }
});

HiWork.directive('numbersOnly', function () {
    return {
        require: 'ngModel',
        link: function (scope, element, attrs, modelCtrl) {
            modelCtrl.$parsers.push(function (inputValue) {
                if (inputValue == undefined) return '';
                var transformedInput = inputValue.replace(/[^0-9]/g, '');
                if (transformedInput !== inputValue) {
                    modelCtrl.$setViewValue(transformedInput);
                    modelCtrl.$render();
                }
                return transformedInput;
            });
        }
    };
});

HiWork.directive('compareTo',
    function() {
        return {
            require: "ngModel",
            scope: {
                otherModelValue: "=compareTo"
            },
            link: function(scope, element, attributes, ngModel) {

                ngModel.$validators.compareTo = function(modelValue) {
                    return modelValue == scope.otherModelValue;
                };

                scope.$watch("otherModelValue",
                    function() {
                        ngModel.$validate();
                    });
            }
        };
    });