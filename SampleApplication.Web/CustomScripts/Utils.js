HiWork.Utils = function () {
    return {
        DbManager: function (serviceName, url) {
            HiWork.factory(serviceName, ['$http', function ($http) {
                var handler = [];
                handler.get = function (actionName) {
                    return $http.get(url + actionName);
                },
                handler.getBy = function (actionName, filterCaption, filterValue) {
                    return $http.get(url + actionName + "?" + filterCaption + "=" + filterValue);
                },
                handler.getById = function (id, actionName) {
                    return $http.get(url + actionName + "?id=" + id);
                },
                handler.update = function (dataModel, actionName) {
                    return $http.post(url + actionName + "/" + dataModel.Id, dataModel, {
                        headers: {
                            'content-type': "application/json",
                            'RequestVerificationToken': jQuery("#RequestVerificationKey").val()
                        }
                    });
                },
                handler.delete = function (id, actionName) {
                    return $http.post(url + actionName + "?id=" + id, {
                        headers: {
                            'content-type': "application/json",
                            'RequestVerificationToken': jQuery("#RequestVerificationKey").val()
                        }
                    });
                },
                handler.create = function (dataModel, actionName) {
                    return $http.post(url + actionName, dataModel, {
                        headers: {
                            'content-type': "application/json",
                            'RequestVerificationToken': jQuery("#RequestVerificationKey").val()
                        }
                    });
                };
                return handler;
            }]);
        }
    };
}