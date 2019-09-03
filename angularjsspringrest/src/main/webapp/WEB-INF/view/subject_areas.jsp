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
				$scope.objEdits = {};
				$scope.area = {"id":"","name":"","qualification":"","active":"Y"};
				$scope.objEmpty = { "area" : {"id":"","name":"","qualification":"","active":"Y"} };
				
				$scope.addObj = function() {
					postObject($http, "doctors", $scope.area, function (resp) {
						$scope.area.id = resp.data.id;
						$scope.doctors.push($scope.area);
						$scope.area = {"id":"","name":"","qualification":"","active":"Y"};
					});
				}
				
				$scope.addAny = function( entity, objName) {
					postObject($http, entity, $scope[objName], function (resp) {
						$scope[objName].id = resp.data.id;
						$scope[entity].push($scope[objName]);
						$scope[objName] = $scope.objEmpty[objName];
					});
				}
				
				$scope.initing = function() {
					search($scope, $http, "doctors", "search/findByQualification?q=MD");
				}
				
				$scope.setViewForEdit = function( entity, docId, val ) {
					$scope.objEdits[ entity + "_" + docId] = val;
					if(!val) {
						loadById($scope[entity], $http, entity, docId);
					}
				}
				
				$scope.rowView = function ( entity, id ) {
					return $scope.objEdits[ entity + "_" + id];
				}
				
				$scope.rowClass = function( entity, id ) {
					return $scope.rowView(entity, id) ? 'form-control' : 'dead';
				}
				
				$scope.updateRow = function( entity, obj ) {
					postObject($http, entity, obj, function (resp) {
						alert(JSON.stringify(resp.data));
					});
					$scope.objEdits[ entity + "_" + obj.id] = false;
				}
			});

		</script>
	</head>
	<body ng-controller = 'cntl' ng-app = 'app' ng-init="initing()">
		<form name = 'cnfBusinessLine_form' >
			<div class='container-fluid'>
				<div class='col-sm-12'>
					<h3>{{msg}}</h3>
				</div>
				<div class='col-sm-12'>
					<h3>Doctors List </h3>
				</div>
				<div class='col-sm-12'>
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
									<input ng-model="doc.name" ng-readonly="!rowView('doctors', doc.id)" ng-class="rowClass('doctors', doc.id)" />
								</td>
								<td>
									<input ng-model="doc.qualification" ng-readonly="!rowView('doctors', doc.id)" ng-class="rowClass('doctors', doc.id)"  />
								</td>
								<td>
									<span class="glyphicon glyphicon-edit" ng-show="!rowView('doctors', doc.id)" 
										style='color:green;cursor:hand;' ng-click="setViewForEdit( 'doctors', doc.id, true)"></span>
									<span class="glyphicon glyphicon-ok-circle" ng-show="rowView('doctors', doc.id)" 
										style='color:green;cursor:hand;' ng-click="updateRow( 'doctors', doc )"></span>
									<span class="glyphicon glyphicon-remove-circle" ng-show="rowView('doctors', doc.id)"
										style='color:red;cursor:hand;' ng-click="setViewForEdit( 'doctors', doc.id, false)"></span>
								</td>
							</tr>
							<tr>
								<td>
									<input ng-model="obj.name" class='form-control' />
								</td>
								<td>
									<input ng-model="obj.qualification" class='form-control'  />
								</td>
								<td>
									<input type="image" src="image/user-add-icon.png" style="color:red;" ng-click="addAny('doctors','obj')"/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</form>
	</body>
</html>				
