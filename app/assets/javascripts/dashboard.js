var dashboard = angular.module('dashboard', []);

dashboard.controller("garmentsController", function ($scope, $http) {
    $http.get('http://localhost:3000/api/v1/garments/').success(function (data) {
    	$scope.garments = data;
      console.log(data);
    });
});