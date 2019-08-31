<html >
	<head >
		<title >Doctors</title>
		<link rel = 'stylesheet' href = 'css/bootstrap.min.css' type = 'text/css' />
		<link rel = 'stylesheet' href = 'css/table-abir.css' type = 'text/css' />
		<script src = 'js/jquery-1.9.1.js' type = 'text/javascript' ></script>
		<script src = 'js/bootstrap.min.js' type = 'text/javascript' ></script>
		<script src = 'js/angular.min.js' type = 'text/javascript' ></script>
		<script src = 'js/common.js' type = 'text/javascript' ></script>
		<script >
			
			var app = angular.module( 'app',[]);
			app.controller( 'cntl', function($scope,$http) {
				$scope.st = ["Y","N"];
				$scope.entity = "doctors";
				$scope.obj = {"id":"","name":"","qualification":"","active":"Y"};
				$scope.searchObj = { "name" : "" };
				
				$scope.search = function() {
					search($scope, $http, $scope.entity
							, "search/findByNameContaining?name=" + $scope.searchObj.name);
				}
				
				$scope.loadObject = function( id ) {
					$http.get( $scope.entity + "/" + id)
					 .then( function(res) {
						 $scope.obj = res.data;
						 $scope.isDetail = true;
					 });
				}
				
				$scope.reset = function() {
					$scope.obj = {"id":"","name":"","qualification":"","active":"Y"};
				}
				
				$scope.addObj = function() {
					postObject($http, $scope.entity, $scope.obj, function (resp) {
						$scope.obj.id = resp.data.id;
					});
				}
				
				$scope.updateObj = function() {
					postObject($http, $scope.entity, $scope.obj, function (resp) {
						
					});
				}
				$scope.back = function() {
					$scope.isDetail = false;
					$scope.search();
				}
			});

		</script>
	</head>
	<body ng-controller = 'cntl' ng-app = 'app' >
			<div class='container-fluid'>
				<h3>{{msg}}</h3>
				<div ng-hide='isDetail'>
					<div class='col-sm-12'>
						<h3>Search Doctors </h3>
					</div>
					<div class='col-sm-6'>
						<input ng-model="searchObj.name" class='form-control' placeholder="Doctor's Name" />
					</div>
					<div class='col-sm-6'>
						<input ng-click="search()" type="image" src="image/search-cute.png" width="30" height="30" />
					</div>
					<div class='col-sm-12' style="margin-top: 10px;">
						<table class='table'>
							<thead>
								<tr>
									<th>Doctor Name</th>
									<th>Qualification</th>
									<th/>
								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="doc in doctors">
									<td>
										<span>{{doc.name}}</span>
									</td>
									<td>
										<span>{{doc.qualification}}</span>
									</td>
									<td>
										<span class="glyphicon glyphicon-edit" style='color:green;cursor:hand;' ng-click="loadObject( doc.id )"></span>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class='col-sm-12' style="margin-top: 10px;" ng-show="isDetail">
					<h4>Doctor Details</h4>
					<div class='form-group'>
						<Label>Doctor Name</Label>
						<input ng-model="obj.name" class='form-control' />
					</div>
					<div class='form-group'>
						<Label>Qualification</Label>
						<input ng-model="obj.qualification" class='form-control' />
					</div>
					<div align="center">
						<input type="button" value="Save New" ng-hide="obj.id" ng-click="addObj()" class='btn btn-sm btn-success'/>
						<input type="button" value="Update"  ng-show="obj.id" ng-click="updateObj()" class='btn btn-sm btn-success'/>
						<input ng-click='reset()' type="button" value="Reset" class='btn btn-sm btn-info' />
						<input ng-click='back()' type="button" value="Back" class='btn btn-sm btn-primary' />
					</div>		
				</div>
			</div>
	</body>
</html>				
