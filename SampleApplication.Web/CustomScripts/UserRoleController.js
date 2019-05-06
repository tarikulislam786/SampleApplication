var utils = new HiWork.Utils();
utils.DbManager('userRoleFactory', "/Api/ApiAdmin/");

HiWork.controller("UserRoleController", ['$scope', '$http', '$window', 'userRoleFactory', function ($scope, $http, $window, userRoleFactory) {
    $scope.isSubmitted = false;
    $scope.isPosted = false;

   // debugger;
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

      userRoleFactory.get("UserRoleList").then(function (result) {
         $scope.userRoleList = result.data;
        });
    }
    showList();

    //userRoleFactory.get("UserRoleList").then(function (result) {
    //    $scope.userRoleList = result.data;
    //});

    // Show Details
    $scope.showDetails = function (role) {
        userRoleFactory.getById(role.Id, "UserRoleDetails").then(function (result) {
            if (result.data != null) {
                $scope.userRoleVM = result.data;
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
    $scope.saveUserRole = function (userRoleForm) {
        $scope.isSubmitted = true;
        if (userRoleForm.$invalid) {
            $scope.showValidation = true;
            $scope.isSubmitted = true;
            $scope.toggleValidationSummary = function () {
                $scope.showValidation = !$scope.showValidation;
            };
            return;
        } else {
            if ($scope.userRoleVM != undefined || $scope.userRoleVM != null) {
                if ($scope.userRoleVM.Id == undefined || $scope.userRoleVM.Id.length <= 0) {
                    //$scope.loading = true;
                    $scope.isPosted = true;
                    userRoleFactory.create($scope.userRoleVM, "CreateUserRole").then(showMessage);
                    //$window.location.href = '/Home/UserType';
                } else {
                    //$scope.loading = true;
                    $scope.isPosted = true;
                    userRoleFactory.update($scope.userRoleVM, "UpdateUserRole").then(showMessage);
                }
            }
        }
    };
}]);





