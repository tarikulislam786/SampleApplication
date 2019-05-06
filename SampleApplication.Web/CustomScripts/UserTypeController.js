var utils = new HiWork.Utils();
utils.DbManager('userTypeFactory', "/Api/ApiAdmin/");

HiWork.controller("UserTypeController", ['$scope', '$http', '$window', 'userTypeFactory', function ($scope, $http, $window, userTypeFactory) {
    $scope.isSubmitted = false;
    $scope.isPosted = false;

    // Show List
    var showList = function () {
     //var req = {
     //       method: 'Get',
     //       url: '/api/ApiAdmin/UserTypeList'
     //   }
     //   $http(req).then(function (result) {
     //       $scope.userTypeList = result.data;
     //   });
     //   $scope.userTypeVM = null;

     userTypeFactory.get("UserTypeList").then(function (result) {
         $scope.userTypeList = result.data;
     });
    }
    showList();

    //userTypeFactory.get("UserTypeList").then(function (result) {
    //    $scope.userTypeList = result.data;
    //});

    // Show Details
    $scope.showDetails = function (userType) {
        userTypeFactory.getById(userType.Id, "UserTypeDetails").then(function (result) {
            if (result.data != null) {
                $scope.userTypeVM = result.data;
            } else {
                alert("Data not found.");
            }
        });

        //var req = {
        //    method: 'Get',
        //    url: '/api/ApiAdmin/UserTypeDetails',
        //    data: userType
        //}
        //$http(req).then(function (result) {
        //    if (result.data != null) {
        //        $scope.userTypeVM = result.data;
        //    } else {
        //        alert("Data not found.");
        //    }
        //});
    }

    // Show Success Message
    var showMessage = function (result) {
        if (result.data.IsOperationSuccessful === false) {
        } else {
            showList();
            $scope.loading = false;
            $scope.isSubmitted = false;
            //$window.history.back();
            //$window.location.href = '/Agent/Index';
        }
        $scope.isPosted = false;
        alert(result.data.Message);
    };

    // Insert or Update
    $scope.saveUserType = function (userTypeForm) {
        $scope.isSubmitted = true;
        if (userTypeForm.$invalid) {
            $scope.showValidation = true;
            $scope.isSubmitted = true;
            $scope.toggleValidationSummary = function () {
                $scope.showValidation = !$scope.showValidation;
            };
            return;
        } else {
            if ($scope.userTypeVM != undefined || $scope.userTypeVM != null) {
                if ($scope.userTypeVM.Id == undefined || $scope.userTypeVM.Id.length <= 0) {
                    //$scope.loading = true;
                    $scope.isPosted = true;
                    userTypeFactory.create($scope.userTypeVM, "CreateUserType").then(showMessage);
                    //$window.location.href = '/Home/UserType';
                } else {
                    //$scope.loading = true;
                    $scope.isPosted = true;
                    userTypeFactory.update($scope.userTypeVM, "UpdateUserType").then(showMessage);
                }
            }
        }
    };
}]);





