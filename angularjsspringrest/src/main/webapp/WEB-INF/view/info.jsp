<html >
	<head >
		<title >Business Lines</title>
		<link rel = 'stylesheet' href = 'css/bootstrap.min.css' type = 'text/css' />
		<script src = 'js/jquery-1.9.1.js' type = 'text/javascript' ></script>
		<script src = 'js/bootstrap.min.js' type = 'text/javascript' ></script>
		<script src = 'js/angular.min.js' type = 'text/javascript' ></script>
		<script src = 'js/common.js' type = 'text/javascript' ></script>
		<script>
			var app = angular.module( 'config_app',[]);
			app.controller( 'config_controller', function($scope,$http) {
				$scope.md = ${cnfBusinessLine};
				$scope.lineId = 0;
				$scope.st = ["Y","N"];
				$scope.loadLine = function() {
					$http.get("bline?id=" + $scope.lineId)
						.then(function(resp) {
							$scope.md = resp.data;
						});
				}
			});
		</script>
	</head>
	<body ng-controller = 'config_controller' ng-app = 'config_app' >
			<div class = 'container-fluid' >
				<div class='col-sm-6'>
					<input class='form-control' ng-change="loadLine()" ng-model='lineId' /> 
				</div>
				<div class='col-sm-6'>
					<h4>{{ md.businessLine }}</h4>
					<select ng-model="md.active" class='form-control' >
						<option ng-repeat="x in st" value="{{x}}">{{x}}</option>
					</select>
				</div>
			</div>
	</body>		
</html>			
			